/// <reference path="action.ts" />
/// <reference path="../jquery.d.ts" />
/// <reference path="../underscore.d.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="../three/three.ts" />
var ActionLoader = (function () {
    function ActionLoader() {
    }
    ActionLoader.prototype.load = function (actionString, id) {
        return new Action(this.getSkeletonFrames(actionString), id);
    };
    ActionLoader.prototype.getSkeletonFrames = function (actionString) {
        var lines = actionString.split("\n");
        lines.pop(); // remove last line
        return lines.map(this.lineToSkeleton);
    };
    ActionLoader.prototype.lineToSkeleton = function (line) {
        var coordinateStrings = line.split(",");
        var coordinates = coordinateStrings.map(parseFloat);
        var vectorCount = coordinates.length / 3;
        var joints = new Array(vectorCount);
        for (var i = 0; i < vectorCount; i++) {
            var x = coordinates[i * 3 + 0];
            var y = coordinates[i * 3 + 1];
            var z = coordinates[i * 3 + 2];
            joints[i] = new THREE.Vector3(x, y, z);
        }
        return new Skeleton(joints);
    };
    return ActionLoader;
})();

var ActionMovement = (function () {
    function ActionMovement(id, movement) {
        this.id = id;
        this.movement = movement;
    }
    return ActionMovement;
})();

var ActionDB = (function () {
    function ActionDB(folderPath, callback) {
        var _this = this;
        this.folderPath = folderPath;
        this.loadIndexFile(function () {
            _this.loadMovementFile(callback);
        });
    }
    ActionDB.prototype.loadMovementFile = function (callback) {
        var _this = this;
        var movementFilePath = this.folderPath + "movement.csv";
        var f = function (s) {
            _this.actionMovements = _this.parseMovementFile(s);
            callback();
        };
        this.getFileContents(movementFilePath, f);
    };
    ActionDB.prototype.parseMovementFile = function (s) {
        var lines = s.split("\n");
        var movements = lines.map(function (l) {
            var fields = l.split(",").map(function (f) {
                return parseFloat(f);
            });
            var id = new ActionIdentifier(fields[0], fields[1], fields[2]);
            return new ActionMovement(id, fields.splice(3));
        });
        var actionMovements = {};
        movements.forEach(function (m) {
            actionMovements[m.id.toString()] = m;
        });
        return actionMovements;
    };

    ActionDB.prototype.classCount = function () {
        if (this.actionCountsByTypeAndSubject == null) {
            return 0;
        } else {
            return this.actionCountsByTypeAndSubject.length;
        }
    };
    ActionDB.prototype.subjectCount = function () {
        if (this.actionCountsByTypeAndSubject == null) {
            return 0;
        } else {
            if (this.actionCountsByTypeAndSubject[0] == null) {
                return 0;
            } else {
                return this.actionCountsByTypeAndSubject[0].length;
            }
        }
    };
    ActionDB.prototype.isValid = function (id) {
        return id.repetition <= this.actionCountsByTypeAndSubject[id.type][id.subject];
    };

    ActionDB.prototype.getAction = function (id, callback) {
        if (!this.isValid(id)) {
            throw new Error("Invalid ActionIdentifier " + id);
        }

        var path = this.getPathForAction(this.folderPath, id);
        var loader = new ActionLoader();

        var f = function (actionString) {
            return callback(loader.load(actionString, id));
        };
        this.getFileContents(path, f);
    };

    ActionDB.prototype.getPathForAction = function (folderPath, id) {
        var filename = "c" + id.type + "_s_" + id.subject + "_r_" + id.repetition + ".csv";
        return folderPath + filename;
    };
    ActionDB.prototype.getFileContents = function (path, callback) {
        $.ajax({
            url: path,
            success: function (data, textStatus, jqXHR) {
                callback(data);
            }
        });
    };

    ActionDB.prototype.loadIndexFile = function (callback) {
        var _this = this;
        var indexFilePath = this.folderPath + "count.csv";
        var f = function (s) {
            _this.actionCountsByTypeAndSubject = _this.parseIndexFile(s);
            _this.ids = _this.generateAllIDs();
            callback();
        };
        this.getFileContents(indexFilePath, f);
    };

    ActionDB.prototype.parseIndexFile = function (contents) {
        var entries = this.getEntries(contents);
        var types = entries.map(function (e) {
            return e.type;
        });
        var subjects = entries.map(function (e) {
            return e.subject;
        });
        return this.generateCountMatrix(entries, types, subjects);
    };
    ActionDB.prototype.generateCountMatrix = function (entries, types, subjects) {
        var typeCount = _.max(types);
        var subjectCount = _.max(subjects);
        var counts = create2DArray(typeCount + 1, subjectCount + 1);
        entries.forEach(function (e) {
            counts[e.type][e.subject] = e.repetitions;
        });
        return counts;
    };

    ActionDB.prototype.getEntries = function (contents) {
        var lines = contents.split("\n");
        lines.shift();
        lines.pop();
        var entries = lines.map(function (line) {
            var vars = line.split(",");
            var type = +vars[0];
            var subject = +vars[1];
            var repetitions = +vars[2];
            return new IndexFileEntry(type, subject, repetitions);
        });
        return entries;
    };
    ActionDB.prototype.generateAllIDs = function () {
        var result = [];
        var classCount = this.classCount();
        var subjectCount = this.subjectCount();
        this.ids = [];
        for (var c = 0; c < classCount; c++) {
            for (var s = 0; s < subjectCount; s++) {
                var repetitions = this.actionCountsByTypeAndSubject[c][s];
                for (var r = 1; r < repetitions; r++) {
                    result.push(new ActionIdentifier(c, s, r));
                }
            }
        }
        return result;
    };
    ActionDB.prototype.indicesOfActionsFor = function (classes, subjects) {
        var indices = [];
        this.ids.forEach(function (id, i) {
            if ($.inArray(id.type, classes) != -1 && $.inArray(id.subject, subjects) != -1) {
                indices.push(i);
            }
        });
        return indices;
    };

    ActionDB.prototype.actionIdentifiersFor = function (classes, subjects) {
        var indices = [];
        this.ids.forEach(function (id, i) {
            if ($.inArray(id.type, classes) != -1 && $.inArray(id.subject, subjects) != -1) {
                indices.push(id);
            }
        });
        return indices;
    };
    ActionDB.prototype.movementsFor = function (ids) {
        var _this = this;
        return ids.map(function (id) {
            return _this.actionMovements[id.toString()];
        });
    };
    ActionDB.prototype.rawMovementsFor = function (ids) {
        return this.movementsFor(ids).map(function (m) {
            var data = m.movement.slice(0);
            data.unshift(m.id.type);
            return data;
        });
    };
    return ActionDB;
})();

var IndexFileEntry = (function () {
    function IndexFileEntry(type, subject, repetitions) {
        this.type = type;
        this.subject = subject;
        this.repetitions = repetitions;
    }
    return IndexFileEntry;
})();
