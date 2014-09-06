/// <reference path="../jquery.d.ts" />
/// <reference path="../model/actiondb.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="picker.ts" />
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var ActionPicker = (function (_super) {
    __extends(ActionPicker, _super);
    function ActionPicker(actionDB) {
        var _this = this;
        _super.call(this);
        this.actionDB = actionDB;
        this.classPicker = new Picker($('#classPicker'), false);
        this.classPicker.setNumbersAsElements(actionDB.classCount());
        this.classPicker.setTooltips(KinectDatabase.classNames());
        this.classPicker.setColors(KinectDatabase.classColors());

        this.subjectPicker = new Picker($('#subjectPicker'), false);
        this.subjectPicker.setNumbersAsElements(actionDB.subjectCount());
        this.repetitionPicker = new Picker($('#repetitionPicker'), true);

        this.subjectPicker.registerCallback(this, 'selectionChanged', function () {
            _this.filterRepetitions();
        });
        this.classPicker.registerCallback(this, 'selectionChanged', function () {
            _this.filterRepetitions();
        });
        this.repetitionPicker.registerCallback(this, 'selectionChanged', function () {
            _this.changePlayingItem();
        });
        this.filterRepetitions();
    }
    ActionPicker.prototype.changePlayingItem = function () {
        if (this.actionSelected()) {
            //this.autoScrollRepetitionPicker();
            this.notify('actionSelected');
        } else {
            this.notify('actionUnselected');
        }
    };

    ActionPicker.prototype.validSelection = function () {
        var classes = this.classPicker.selectedElements();
        var subjects = this.subjectPicker.selectedElements();
        return classes.length > 0 && subjects.length > 0;
    };
    ActionPicker.prototype.actionSelected = function () {
        return this.repetitionPicker.selectedIndices().length > 0;
    };

    ActionPicker.prototype.autoScrollRepetitionPicker = function () {
        var selected = this.repetitionPicker.selectedIndices();
        if (selected.length > 0) {
            var li = $(this.repetitionPicker.getElements()[selected[0]]);
            this.repetitionPicker.list.scrollTop(li.position().top);
        }
    };
    ActionPicker.prototype.filterRepetitions = function () {
        var classes = this.classPicker.selectedElements();
        var subjects = this.subjectPicker.selectedElements();
        if (classes.length > 0 && subjects.length > 0) {
            //var indices:number[]= this.indicesOfActionsFor(classes,subjects);
            var actionIdentifiers = this.actionDB.actionIdentifiersFor(classes, subjects);
            var texts = actionIdentifiers.map(function (id) {
                return "s" + id.subject + "r" + id.repetition;
            });
            this.repetitionPicker.setElementsWithLabels(actionIdentifiers, texts);
            var classColors = KinectDatabase.classColors();
            var colors = actionIdentifiers.map(function (id) {
                return classColors[id.type - 1];
                debugger;
            });
            this.repetitionPicker.setColors(colors);
            this.repetitionPicker.selectNone();
            this.notify('filterChanged');
        } else {
            this.repetitionPicker.selectNone();
            this.repetitionPicker.showElements([]);
            this.notify('invalidFilter');
        }
        this.notify('actionUnselected');
    };
    return ActionPicker;
})(ObservableObject);
