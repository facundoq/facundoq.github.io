//DONE
// picker pick all none DO
// TODO
// autoscroll repetition list
// fps controller
// action+id in #tabs with background
// explain graph
/// <reference path="three.d.ts" />
/// <reference path="jquery.d.ts" />
/// <reference path="jqueryui.d.ts" />
/// <reference path="underscore.d.ts" />
/// <reference path="model/action.ts" />
/// <reference path="util/util.ts" />
/// <reference path="three/three.ts" />
/// <reference path="model/actiondb.ts" />
/// <reference path="animator/ActionAnimator.ts" />
/// <reference path="view/ui.ts" />
/// <reference path="view/actionpicker.ts" />
/// <reference path="view/animationcontrol.ts" />
/// <reference path="view/statistics.ts" />
var config;
var canvas;
var actionDB;
var testAction;
var animationControl;
var actionAnimator;
var ap;
var statisticsControl;

function activatePanel(panelId) {
    statisticsControl.deactivate();
    animationControl.deactivate();
    if (panelId == "action") {
        animationControl.activate();
    }
    if (panelId == "statistics") {
        statisticsControl.activate();
    }
}

function setupUI() {
    $("#tabs").tabs({
        activate: function (event, ui) {
            activatePanel(ui.newPanel.attr("id"));
        }
    });
    ap = new ActionPicker(actionDB);
    animationControl = new AnimationControl("#animation-control", actionAnimator, ap, actionDB);
    statisticsControl = new StatisticsControl('#parallel', ap, actionDB);
    activatePanel('action');
}

$(document).ready(function () {
    canvas = $("#canvas");
    config = initializeThreeJS(canvas);
    setUpResizeHandler();

    var fps = 30;
    actionAnimator = new ActionAnimator(config, fps, false);

    var folder = "gestures/";
    actionDB = new ActionDB(folder, function () {
        setupUI();
    });
});
