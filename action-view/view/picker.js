/// <reference path="../jquery.d.ts" />
/// <reference path="../util/util.ts" />
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var Picker = (function (_super) {
    __extends(Picker, _super);
    function Picker(element, single) {
        var _this = this;
        _super.call(this);
        this.single = single;
        this.element = element;
        this.list = element.find('ol');
        this.selectAllButton = element.find('.selectAll');
        this.selectNoneButton = element.find('.selectNone');

        this.selectAllButton.button();
        this.selectNoneButton.button();
        this.elements = $();
        this.selectNoneButton.click(function () {
            _this.selectNone();
            _this.notifySelectionChange();
        });
        this.selectAllButton.click(function () {
            _this.selectAll();
            _this.notifySelectionChange();
        });
        var options = {
            filter: 'li',
            selected: function (e, ui) {
                if (_this.single) {
                    $(ui.selected).addClass("ui-selected").siblings().removeClass("ui-selected");
                }
                _this.notifySelectionChange();
            }
        };
        if (this.single) {
            this.selectAllButton.hide();
            this.selectNoneButton.hide();
        }
        this.list.selectable(options);
    }
    Picker.prototype.notifySelectionChange = function () {
        this.notify('selectionChanged');
    };
    Picker.prototype.selectNone = function () {
        this.getElements().removeClass('ui-selected');
    };
    Picker.prototype.selectAll = function () {
        this.getElements().addClass('ui-selected');
    };
    Picker.prototype.setNumbersAsElements = function (count) {
        var numbers = _.range(1, count);
        this.setElements(numbers);
    };
    Picker.prototype.setTooltips = function (tooltips) {
        this.elements.each(function (i, e) {
            $(e).attr('title', tooltips[i]);
        });
    };
    Picker.prototype.setElementsWithLabels = function (objects, labels) {
        this.objects = objects;
        this.list.empty();
        for (var i = 0; i < labels.length; i++) {
            var e = $('<li class="ui-state-default">' + labels[i] + '</li>');
            this.list.append(e);
        }
        this.elements = this.list.find('li');
        this.setupElements();
        this.notifySelectionChange();
    };
    Picker.prototype.setElements = function (objects) {
        this.setElementsWithLabels(objects, objects);
    };
    Picker.prototype.showElements = function (indices) {
        var elements = this.getElements();
        elements.hide();
        indices.forEach(function (i) {
            return $(elements[i]).show();
        });
        this.notifySelectionChange();
    };
    Picker.prototype.setupElements = function () {
        // this.getElements().each( (i,e) => {
        //  $(e).click(() => {
        //      this.notifySelectionChange();
        //  });
        // });
    };

    Picker.prototype.getElements = function () {
        //return this.list.find('li');
        return this.elements;
    };
    Picker.prototype.selectElement = function (index) {
        this.selectNone();
        $(this.getElements()[index]).addClass('ui-selected');
        this.notifySelectionChange();
    };
    Picker.prototype.selectedElement = function () {
        var indices = this.selectedIndices();

        return this.objects[indices[0]];
    };
    Picker.prototype.selectedElements = function () {
        var _this = this;
        return this.selectedIndices().map(function (i) {
            return _this.objects[i];
        });
    };
    Picker.prototype.selectedIndices = function () {
        var indices = [];
        var elements = this.getElements();
        for (var i = 0; i < elements.length; i++) {
            var e = $(elements[i]);
            if (e.is(':visible') && e.hasClass('ui-selected')) {
                indices.push(i);
            }
        }
        return indices;
    };

    Picker.prototype.setColors = function (colors) {
        this.getElements().each(function (i, e) {
            $(e).css("background-color", colors[i]);
        });
    };
    return Picker;
})(ObservableObject);
