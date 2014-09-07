/// <reference path="../three/three.ts" />
var KinectDatabase = (function () {
    function KinectDatabase() {
    }
    KinectDatabase.classNames = function () {
        var names = [
            "Raise outstretched arms", "Crouch", "Swipe right", "Put on goggles", "Circle with both hands",
            "Shoot", "Bow", "Throw an object", "Raise hands", "Change weapon", "Beat the air with both your hands", "Kick"];
        return names;
    };
    KinectDatabase.classColors = function () {
        return ["#1f4464", "#ff7f0e", "#1c901c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17aeef", "#23FF89", "#FF0012"];
    };
    KinectDatabase.jointNames = function () {
        var names = [
            "SpineBase",
            "SpineMid",
            "Neck",
            "Head",
            "ShoulderLeft",
            "ElbowLeft",
            "WristLeft",
            "HandLeft",
            "ShoulderRight",
            "ElbowRight ",
            "WristRight",
            "HandRight",
            "HipLeft",
            "KneeLeft",
            "AnkleLeft",
            "FootLeft",
            "HipRight",
            "KneeRight",
            "AnkleRight",
            "FootRight"
        ];
        return names;
    };
    return KinectDatabase;
})();

var ActionIdentifier = (function () {
    function ActionIdentifier(type, subject, repetition) {
        this.type = type;
        this.subject = subject;
        this.repetition = repetition;
    }
    ActionIdentifier.prototype.jointCount = function () {
        return 20;
    };
    ActionIdentifier.prototype.toString = function () {
        return "c" + this.type + "s" + this.subject + "r" + this.repetition;
    };
    return ActionIdentifier;
})();
var Action = (function () {
    function Action(frames, id) {
        this.frames = frames;
        this.id = id;
    }
    return Action;
})();

var Skeleton = (function () {
    function Skeleton(joints) {
        this.joints = joints;
    }
    return Skeleton;
})();

var Position3D = (function () {
    function Position3D(x, y, z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    return Position3D;
})();
