// Select joints:  http://pterkildsen.com/2013/06/28/create-a-html5-canvas-element-with-clickable-elements/
//http://parallax3d.org/
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
/// <reference path="../three.d.ts" />
/// <reference path="../jquery.d.ts" />
/// <reference path="../three/three.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />
var Status;
(function (Status) {
    Status[Status["Play"] = 0] = "Play";
    Status[Status["Pause"] = 1] = "Pause";
    Status[Status["Stop"] = 2] = "Stop";
    Status[Status["NotReady"] = 3] = "NotReady";
})(Status || (Status = {}));

var TimerState;
(function (TimerState) {
    TimerState[TimerState["Paused"] = 0] = "Paused";
    TimerState[TimerState["Running"] = 1] = "Running";
})(TimerState || (TimerState = {}));
var Timer = (function () {
    function Timer() {
        this.stop();
    }
    Timer.prototype.stop = function () {
        this.elapsedTime = 0;
        this.state = 0 /* Paused */;
    };
    Timer.prototype.start = function () {
        this.state = 1 /* Running */;
        this.lastTimestamp = new Date();
        return this;
    };
    Timer.prototype.pause = function () {
        this.addToElapsedTime();
        this.state = 0 /* Paused */;
    };
    Timer.prototype.addToElapsedTime = function () {
        var delta = new Date().getTime() - this.lastTimestamp.getTime();
        this.elapsedTime += delta;
    };
    Timer.prototype.elapsed = function () {
        switch (this.state) {
            case 1 /* Running */:
                this.addToElapsedTime();
                break;
            case 0 /* Paused */:
                break;
        }
        this.lastTimestamp = new Date();
        return this.elapsedTime;
    };
    return Timer;
})();

var FrameTimer = (function () {
    function FrameTimer(fps) {
        this.fps = fps;
        this.timer = new Timer();
    }
    FrameTimer.prototype.start = function () {
        this.lastFrame = 0;
        this.timer.start();
        return this;
    };
    FrameTimer.prototype.pause = function () {
        this.timer.pause();
    };
    FrameTimer.prototype.stop = function () {
        this.timer.stop();
    };
    FrameTimer.prototype.currentFrame = function () {
        this.lastFrame = Math.round((this.timer.elapsed() / 1000) * this.fps);
        return this.lastFrame;
    };
    return FrameTimer;
})();

var JointLine = (function () {
    function JointLine(jointA, jointB) {
        this.jointA = jointA;
        this.jointB = jointB;
    }
    JointLine.kinectJointCount = function () {
        return 20;
    };
    JointLine.kinectJointLines = function () {
        var jointLines = [
            new JointLine(0, 1),
            new JointLine(1, 2),
            new JointLine(2, 3),
            new JointLine(0, 12),
            new JointLine(0, 16),
            new JointLine(2, 4),
            new JointLine(2, 8),
            new JointLine(4, 5),
            new JointLine(5, 6),
            new JointLine(6, 7),
            new JointLine(8, 9),
            new JointLine(9, 10),
            new JointLine(10, 11),
            new JointLine(12, 13),
            new JointLine(13, 14),
            new JointLine(14, 15),
            new JointLine(16, 17),
            new JointLine(17, 18),
            new JointLine(18, 19)
        ];
        return jointLines;
    };
    return JointLine;
})();

var ActionAnimator = (function (_super) {
    __extends(ActionAnimator, _super);
    function ActionAnimator(config, fps, loop) {
        _super.call(this);
        this.config = config;
        this.fps = fps;
        this.loop = loop;
        this.timer = new FrameTimer(fps);
        this.jointLines = JointLine.kinectJointLines();
        this.setupSkeleton();
        this.setupScene();
        this.clearAction();
    }
    ActionAnimator.prototype.clearAction = function () {
        this.action = null;
        this.status = 3 /* NotReady */;
        this.hideSkeleton();
        this.notify('notReady');
    };
    ActionAnimator.prototype.setAction = function (action) {
        this.stop();
        this.action = action;
        this.showFirstFrame();
        this.notify('actionSet');
    };
    ActionAnimator.prototype.hasAction = function () {
        return this.action !== null;
    };

    ActionAnimator.prototype.play = function () {
        var _this = this;
        this.status = 0 /* Play */;
        this.timer.start();
        var render = function () {
            if (_this.status != 2 /* Stop */) {
                requestAnimationFrame(render);
                if (_this.status == 0 /* Play */) {
                    _this.checkUpdateSkeleton();
                    _this.config.render();
                }
            }
        };
        render();
        this.notify('play');
    };
    ActionAnimator.prototype.toggleLoop = function () {
        this.loop = !this.loop;
        this.notify('loopChanged');
    };
    ActionAnimator.prototype.pause = function () {
        this.status = 1 /* Pause */;
        this.timer.pause();
        this.notify('pause');
    };
    ActionAnimator.prototype.showFirstFrame = function () {
        var _this = this;
        if (this.hasAction() && this.action.frames.length > 0) {
            requestAnimationFrame(function () {
                _this.updateSkeleton(0);
                _this.config.render();
            });
        }
    };
    ActionAnimator.prototype.stop = function () {
        if (this.status !== 2 /* Stop */) {
            this.timer.stop();
            this.notify('stop');
            this.status = 2 /* Stop */;
        }
    };
    ActionAnimator.prototype.setupScene = function () {
        var pointLight = new THREE.PointLight(0xFFFFFF);

        // set its position
        pointLight.position.x = 10;
        pointLight.position.y = 50;
        pointLight.position.z = 130;

        // add to the scene
        this.config.scene.add(pointLight);
        //this.addAxis(this.config.scene,2);
    };
    ActionAnimator.prototype.addAxis = function (scene, size) {
        var origin = new THREE.Vector3(0, 0, 0);
        var terminus = new THREE.Vector3(size, 0, 0);
        var direction = new THREE.Vector3().subVectors(terminus, origin).normalize();
        var arrow = new THREE.ArrowHelper(direction, origin, 1, 0x884400);
        scene.add(arrow);
    };

    ActionAnimator.prototype.hideSkeleton = function () {
        var _this = this;
        this.joints.forEach(function (joint, i) {
            joint.position.set(0, 0, 0);
        });
        this.updateJointLines();
        requestAnimationFrame(function () {
            _this.config.render();
        });
    };
    ActionAnimator.prototype.updateJointPositions = function (skeleton) {
        var _this = this;
        var positions = skeleton.joints;

        //debugger;
        positions.forEach(function (p, i) {
            _this.joints[i].position.set(p.x, p.y, p.z);
        });
    };
    ActionAnimator.prototype.updateJointLines = function () {
        var _this = this;
        this.jointLines.forEach(function (line, i) {
            var lineObject = _this.jointLinesObjects[i];
            var positionA = _this.joints[line.jointA].position;
            var positionB = _this.joints[line.jointB].position;
            lineObject.geometry.vertices[0].set(positionA.x, positionA.y, positionA.z);
            lineObject.geometry.vertices[1].set(positionB.x, positionB.y, positionB.z);
            lineObject.geometry.dynamic = true;
            lineObject.geometry.verticesNeedUpdate = true;
            lineObject.geometry.normalsNeedUpdate = true;
        });
    };
    ActionAnimator.prototype.updateSkeleton = function (frameNumber) {
        var skeleton = this.action.frames[frameNumber];
        this.updateJointPositions(skeleton);
        this.updateJointLines();
    };
    ActionAnimator.prototype.checkUpdateSkeleton = function () {
        var lastFrame = this.timer.lastFrame;
        var frameNumber = this.timer.currentFrame();
        if (this.action.frames.length <= frameNumber) {
            this.stop();
            this.notify('finishedAnimation');
            if (this.loop) {
                this.play();
            }
        } else {
            if (lastFrame < frameNumber) {
                this.notify('frameChanged');
            }
            this.updateSkeleton(frameNumber);
        }
    };
    ActionAnimator.prototype.createJointSphere = function () {
        var material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
        var sphereMaterial = new THREE.MeshLambertMaterial({ color: 0x00AAAA });
        var radius = 0.015;
        var segments = 16;
        var rings = 16;
        var sphere = new THREE.Mesh(new THREE.SphereGeometry(radius, segments, rings), sphereMaterial);
        sphere.geometry.dynamic = true;
        sphere.geometry.verticesNeedUpdate = true;
        sphere.geometry.normalsNeedUpdate = true;
        return sphere;
    };

    ActionAnimator.prototype.setupSkeleton = function () {
        // TODO: add 20 points, indexed
        // TODO: add lines between points
        var jointCount = JointLine.kinectJointCount();
        this.joints = new Array(jointCount);
        for (var i = 0; i < jointCount; i++) {
            this.joints[i] = this.createJointSphere();
            this.config.scene.add(this.joints[i]);
        }
        this.setupJointLines();
    };
    ActionAnimator.prototype.createJointLineObject = function () {
        var material = new THREE.LineBasicMaterial({
            color: 0xFFFFFF, linewidth: 4
        });
        var geometry = new THREE.Geometry();
        geometry.vertices.push(new THREE.Vector3(0, 1, 0));
        geometry.vertices.push(new THREE.Vector3(0, 0, 0));
        geometry.dynamic = true;
        geometry.verticesNeedUpdate = true;
        geometry.normalsNeedUpdate = true;
        return new THREE.Line(geometry, material);
    };
    ActionAnimator.prototype.setupJointLines = function () {
        var _this = this;
        this.jointLinesObjects = this.jointLines.map(function (j) {
            return _this.createJointLineObject();
        });
        this.jointLinesObjects.forEach(function (o) {
            return _this.config.scene.add(o);
        });
    };
    return ActionAnimator;
})(ObservableObject);
