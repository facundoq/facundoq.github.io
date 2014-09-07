/// <reference path="../jquery.d.ts" />
/// <reference path="../animator/ActionAnimator.ts" />
/// <reference path="../model/actiondb.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="picker.ts" />
/// <reference path="actionpicker.ts" />
var AnimationControl = (function () {
    function AnimationControl(id, actionAnimator, ap, actionDB) {
        this.playLabel = '|>';
        this.pauseLabel = '||';
        this.rewindLabel = '<<';
        this.element = $(id);
        this.ap = ap;
        this.apAdapter = new ObservableObjectAdapter(ap);
        this.actionDB = actionDB;
        this.progressBar = $('#progressbar');
        this.progressBar.progressbar({ value: 0 });
        this.actionIdentifier = $('#actionIdentifier');
        this.actionIdentifier.text('No action selected.');
        this.actionAnimator = actionAnimator;
        this.actionAnimatorAdapter = new ObservableObjectAdapter(actionAnimator);
        this.addButtons();
        this.setupEventListeners();
    }
    AnimationControl.prototype.setupEventListeners = function () {
        var _this = this;
        this.actionAnimatorAdapter.registerCallback(this, 'play', function () {
            _this.stop.prop("disabled", false);
            _this.play.prop("disabled", false);
            _this.play.button("option", 'label', _this.pauseLabel);
        });

        this.actionAnimatorAdapter.registerCallback(this, 'pause', function () {
            _this.stop.prop("disabled", false);
            _this.play.prop("disabled", false);
            _this.play.button("option", 'label', _this.playLabel);
        });

        this.actionAnimatorAdapter.registerCallback(this, 'notReady', function () {
            _this.stop.prop("disabled", true);
            _this.play.prop("disabled", true);
            _this.play.button("option", 'label', _this.playLabel);
            _this.progressBar.progressbar({ value: 0 });
            _this.actionIdentifier.text('No action selected.');
            _this.updateTimeLabel();
        });
        this.actionAnimatorAdapter.registerCallback(this, 'finishedAnimation', function () {
            if (!actionAnimator.loop) {
                var indices = _this.ap.repetitionPicker.selectedIndices();
                var index = indices[0];
                if (index < _this.ap.repetitionPicker.objects.length) {
                    _this.ap.repetitionPicker.selectElement(index + 1);
                }
            }
        });

        this.apAdapter.registerCallback(this, 'actionSelected', function () {
            _this.playSelectedAction();
        });
        this.apAdapter.registerCallback(this, 'actionSelected', function () {
            _this.actionAnimator.stop();
            _this.actionAnimator.clearAction();
        });

        this.apAdapter.registerCallback(this, 'actionUnselected', function () {
            _this.actionAnimator.stop();
            _this.actionAnimator.clearAction();
        });

        this.actionAnimatorAdapter.registerCallback(this, 'actionSet', function () {
            _this.stop.prop("disabled", true);
            _this.play.prop("disabled", false);
            _this.play.button("option", 'label', _this.playLabel);
            _this.progressBar.progressbar({ value: 0 });
            var action = _this.actionAnimator.action;
            _this.actionIdentifier.text('Action: ' + action.id.toString());
            _this.updateTimeLabel();
        });

        this.actionAnimatorAdapter.registerCallback(this, 'stop', function () {
            _this.stop.prop("disabled", true);
            _this.play.prop("disabled", false);
            _this.play.button("option", 'label', _this.playLabel);
            _this.progressBar.progressbar({ value: 0 });
        });
        this.actionAnimatorAdapter.registerCallback(this, 'frameChanged', function () {
            var p = _this.actionAnimator.timer.currentFrame() / _this.actionAnimator.action.frames.length;
            p = Math.round(p * 100);
            _this.progressBar.progressbar({ value: p });
            _this.updateTimeLabel();
        });

        this.actionAnimator.registerCallback(this, 'loopChanged', function () {
            _this.updateLoopStatus();
        });
    };
    AnimationControl.prototype.loadSelectedAction = function (callback) {
        var _this = this;
        var actionIdentifier = this.ap.repetitionPicker.selectedElement();
        this.actionAnimator.stop();
        this.actionDB.getAction(actionIdentifier, function (action) {
            _this.actionAnimator.setAction(action);
            callback();
        });
    };
    AnimationControl.prototype.playSelectedAction = function () {
        var _this = this;
        this.loadSelectedAction(function () {
            _this.actionAnimator.play();
        });
    };
    AnimationControl.prototype.updateLoopStatus = function () {
        if (this.actionAnimator.loop) {
            this.loop.button("option", 'label', 'Mode:Loop');
        } else {
            this.loop.button("option", 'label', "Mode:Next");
        }
    };

    AnimationControl.prototype.disablePlayStop = function () {
        this.play.prop("disabled", true);
        this.stop.prop("disabled", true);
    };
    AnimationControl.prototype.disableAll = function () {
        this.disablePlayStop();
    };
    AnimationControl.prototype.updateEnabledElements = function (actionAnimator) {
        this.disablePlayStop();
    };

    AnimationControl.prototype.setupButtons = function () {
        this.play = $('#play');
        this.stop = $('#stop');
        this.loop = $('#loop');
    };

    AnimationControl.prototype.updatePlayStatus = function () {
        if (this.actionAnimator.status == 0 /* Play */) {
            this.play.button("option", 'label', this.pauseLabel);
        } else {
            this.play.button("option", 'label', this.playLabel);
        }
    };
    AnimationControl.prototype.addButtons = function () {
        var _this = this;
        this.setupButtons();
        this.play.button();
        this.updatePlayStatus();
        this.play.click(function () {
            if (_this.actionAnimator.status == 0 /* Play */) {
                _this.actionAnimator.pause();
            } else {
                _this.actionAnimator.play();
            }
        });

        this.stop.button();
        this.play.text();
        this.stop.click(function () {
            _this.actionAnimator.stop();
            _this.actionAnimator.play();
        });
        this.stop.button("option", 'label', this.rewindLabel);

        this.stop.prop("disabled", true);
        this.play.prop("disabled", true);

        this.loop.button();
        this.updateLoopStatus();
        this.loop.click(function () {
            return _this.actionAnimator.toggleLoop();
        });
        $(document).tooltip({ show: {
                delay: 750
            } });
    };
    AnimationControl.prototype.updateTimeLabel = function () {
        if (this.actionAnimator.action != null) {
            var totalFrames = this.actionAnimator.action.frames.length;
            var currentFrame = this.actionAnimator.timer.lastFrame;
            $('#timeLabel').text(currentFrame + "/" + totalFrames);
        } else {
            $('#timeLabel').text('0/0');
        }
    };

    AnimationControl.prototype.activate = function () {
        this.apAdapter.paused = false;
        this.actionAnimatorAdapter.paused = false;
        if (this.ap.actionSelected()) {
            this.loadSelectedAction(function () {
            });
        } else {
            this.actionAnimator.clearAction();
            this.ap.repetitionPicker.selectNone();
        }
    };
    AnimationControl.prototype.deactivate = function () {
        this.actionAnimator.stop();
        this.actionAnimator.clearAction();

        this.apAdapter.paused = true;
        this.actionAnimatorAdapter.paused = true;
    };
    return AnimationControl;
})();
