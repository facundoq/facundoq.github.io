/// <reference path="../d3.d.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../model/actiondb.ts" />
var StatisticsControl = (function () {
    function StatisticsControl(id, ap, actionDB) {
        this.element = $(id);
        this.ap = ap;
        this.apAdapter = new ObservableObjectAdapter(ap);
        this.actionDB = actionDB;
        this.setupEventListeners();
    }
    StatisticsControl.prototype.highlightSelectedAction = function () {
        var id = this.ap.repetitionPicker.selectedElement();
        var data = this.transformData(this.actionDB.rawMovementsFor([id]));
        this.parallel.highlight(data);
    };
    StatisticsControl.prototype.setupEventListeners = function () {
        var _this = this;
        this.apAdapter.registerCallback(this, 'actionSelected', function () {
            _this.highlightSelectedAction();
        });

        this.apAdapter.registerCallback(this, 'actionUnselected', function () {
            _this.getParallel().unhighlight();
        });

        this.apAdapter.registerCallback(this, 'filterChanged', function () {
            _this.displayInformation();
        });
        this.apAdapter.registerCallback(this, 'invalidFilter', function () {
            _this.getParallel().data([]).render();
            //.createAxes();
        });
    };
    StatisticsControl.prototype.displayInformation = function () {
        var ids = this.ap.repetitionPicker.objects;
        this.data = this.transformData(this.actionDB.rawMovementsFor(ids));
        var alpha = Math.max(1000 / Math.sqrt(this.data.length), 0.01);
        this.getParallel().data(this.data).render().shadows().updateAxes().autoscale().alpha(alpha).render();
        //this.getParallel().axisDots();
        //d3.selectAll(".tick > text").style("font-size", 10);
    };
    StatisticsControl.prototype.header = function () {
        var header = ['class'];
        return header.concat(KinectDatabase.jointNames());
    };
    StatisticsControl.prototype.jointsToShow = function () {
        return [0, 1, 3, 7, 11, 15, 19];
    };
    StatisticsControl.prototype.transformData = function (data) {
        var header = this.header();
        var result = [];
        var jointsToShow = this.jointsToShow();
        for (var i = 0; i < data.length; i++) {
            var row = data[i];
            var newRow = {};
            row.forEach(function (r, i) {
                if (i == 0 || _.include(jointsToShow, i - 1)) {
                    newRow[header[i]] = r;
                }
            });
            ;
            result.push(newRow);
        }

        return result;
    };

    StatisticsControl.prototype.parallelPrototype = function () {
        var parallel = d3.parcoords()("#parallel");

        //var class_colors = d3.scale.ordinal().domain([1,12]).range( KinectDatabase.classColors());
        var class_colors = KinectDatabase.classColors();
        var color = function (d) {
            return class_colors[d['class'] - 1];
        };

        parallel = parallel.color(color).alpha(0.3).ticks(4).mode("queue");
        d3.selectAll(".tick > text").style("font-size", 10);
        return parallel;
    };
    StatisticsControl.prototype.getParallel = function () {
        if (this.parallel == null) {
            this.parallel = this.parallelPrototype();
        }
        return this.parallel;
    };
    StatisticsControl.prototype.activate = function () {
        this.apAdapter.paused = false;
        if (this.ap.validSelection()) {
            this.displayInformation();
            if (this.ap.actionSelected()) {
                this.highlightSelectedAction();
            }
        }
    };
    StatisticsControl.prototype.deactivate = function () {
        this.apAdapter.paused = true;
    };
    return StatisticsControl;
})();
