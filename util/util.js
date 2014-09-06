/// <reference path="../jquery.d.ts" />
var Size = (function () {
    function Size(width, height) {
        this.width = width;
        this.height = height;
    }
    Size.sizeOfElement = function (id) {
        return Size.sizeOfJQueryObject($(id));
    };
    Size.sizeOfJQueryObject = function (object) {
        return new Size(object.width(), object.height());
    };
    return Size;
})();

function create2DArray(rows, columns) {
    var x = new Array(rows);
    for (var i = 0; i < rows; i++) {
        x[i] = new Array(columns);
    }
    return x;
}


var ObjectCallback = (function () {
    function ObjectCallback(object, callback) {
        this.object = object;
        this.callback = callback;
    }
    return ObjectCallback;
})();

var ObservableObject = (function () {
    function ObservableObject() {
        this.callbacks = {};
    }
    ObservableObject.prototype.registerCallback = function (observer, event, callback) {
        var oa = new ObjectCallback(observer, callback);
        if (this.callbacks[event] === undefined) {
            this.callbacks[event] = [oa];
        } else {
            this.callbacks[event].push(oa);
        }
    };

    ObservableObject.prototype.unregisterCallbacks = function (observer, event) {
        var callbacks = this.callbacks[event];
        if (callbacks !== undefined) {
            var indices = [];

            for (var i = 0; i < callbacks.length; i++) {
                if (callbacks[i].object === observer) {
                    indices.push(i);
                }
            }
            for (var i = indices.length - 1; i >= 0; i--) {
                callbacks.splice(indices[i], 1);
            }
        }
    };

    ObservableObject.prototype.notify = function (event) {
        var callbacks = this.callbacks[event];
        if (callbacks !== undefined) {
            callbacks.forEach(function (c) {
                return c.callback();
            });
        }
    };
    return ObservableObject;
})();

var ObservableObjectAdapter = (function () {
    function ObservableObjectAdapter(object) {
        this.paused = false;
        this.object = object;
    }
    ObservableObjectAdapter.prototype.registerCallback = function (observer, event, callback) {
        var _this = this;
        this.object.registerCallback(this, event, function () {
            if (!_this.paused) {
                callback();
            }
        });
    };

    ObservableObjectAdapter.prototype.unregisterCallbacks = function (observer, event) {
        this.object.unregisterCallbacks(this, event);
    };
    return ObservableObjectAdapter;
})();
