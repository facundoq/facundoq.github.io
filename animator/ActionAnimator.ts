// Select joints:  http://pterkildsen.com/2013/06/28/create-a-html5-canvas-element-with-clickable-elements/
//http://parallax3d.org/

/// <reference path="../three.d.ts" />
/// <reference path="../jquery.d.ts" />
/// <reference path="../three/three.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />

enum Status{
	Play,
	Pause,
	Stop,
	NotReady
}

enum TimerState{
	Paused,Running
}
class Timer{
	elapsedTime:number;
	lastTimestamp:Date;
	state:TimerState;

	constructor(){
		this.stop();
	}
	stop():void{
		this.elapsedTime=0;
		this.state=TimerState.Paused;
	}
	start():Timer{
		this.state=TimerState.Running;
		this.lastTimestamp=new Date();
		return this;
	}
	pause():void{
		this.addToElapsedTime();
		this.state=TimerState.Paused;
	}
	addToElapsedTime():void{
		var delta:number= new Date().getTime() - this.lastTimestamp.getTime();
		this.elapsedTime+=delta;
	}
	elapsed():number{
		switch (this.state){
			case TimerState.Running:
				this.addToElapsedTime();
				break;
			case TimerState.Paused:
				break;	
		}
		this.lastTimestamp=new Date();
		return this.elapsedTime;
	}
}

class FrameTimer{
	lastFrame:number;
	fps:number;
	timer:Timer;
	constructor(fps:number){
		this.fps=fps;
		this.timer=new Timer();
	}
	start():FrameTimer{
		this.lastFrame=0;	
		this.timer.start();
		return this;
	}
	pause():void{
		this.timer.pause();
	}
	stop():void{
		this.timer.stop();
	}
	currentFrame():number{
		this.lastFrame= Math.round((this.timer.elapsed()/1000)*this.fps);
		return this.lastFrame;
	}


}

class JointLine{

	jointA:number;
	jointB:number;
	constructor(jointA:number,jointB:number){
		this.jointA=jointA;
		this.jointB=jointB;
	}
	static kinectJointCount():number{
		return 20;
	}
	static kinectJointLines():JointLine[]{
		var jointLines:JointLine[]=[ 
		new JointLine(0,1), // belly button - torso
		new JointLine(1,2), // torso - neck
		new JointLine(2,3), // neck - head

		new JointLine(0,12), //  hips - belly button
		new JointLine(0,16),

		new JointLine(2,4), // neck shoulders
		new JointLine(2,8),

		new JointLine(4,5), // right arm
		new JointLine(5,6),
		new JointLine(6,7),

		new JointLine(8,9), // left arm
		new JointLine(9,10),
		new JointLine(10,11),

		new JointLine(12,13), // right foot
		new JointLine(13,14),
		new JointLine(14,15),

		new JointLine(16,17), // left foot
		new JointLine(17,18),
		new JointLine(18,19),
		 ];
		return jointLines;
	}

}

class ActionAnimator extends ObservableObject{
	config:ThreeJSConfig;
	action:Action;
	fps:number;
	loop:boolean;
	
	status:Status;
	
	joints:THREE.Mesh[];
	jointLines:JointLine[];
	jointLinesObjects:THREE.Line[];
	timer:FrameTimer;
	firstTime:boolean;
	
	constructor(config:ThreeJSConfig,fps:number,loop:boolean){
		super();
		this.config=config;
		this.fps=fps;
		this.loop=loop;
		this.timer=new FrameTimer(fps);
		this.jointLines=JointLine.kinectJointLines();
		this.setupSkeleton();
		this.setupScene();
		this.clearAction();
	}
	clearAction():void{
		this.action=null;
		this.status=Status.NotReady;
		this.hideSkeleton();
		this.notify('notReady');
	}
	setAction(action:Action):void{
		this.stop();
		this.action=action;
        this.showFirstFrame();
		this.notify('actionSet');
	}
	hasAction():boolean{
		return this.action !== null;
	}

	play():void{
		this.status=Status.Play;
		this.timer.start();
		var render = () => {
			if (this.status != Status.Stop){
				requestAnimationFrame(render);
				if (this.status==Status.Play){
					this.checkUpdateSkeleton();
					this.config.render();
				}
			}
		};
		render();
		this.notify('play');
	}
	toggleLoop():void{
		this.loop = ! this.loop;
		this.notify('loopChanged');
	}
	pause():void{
		this.status=Status.Pause;
		this.timer.pause();
		this.notify('pause');
	}
	showFirstFrame():void{
		if ( this.hasAction() && this.action.frames.length>0){
				requestAnimationFrame(() =>{
					this.updateSkeleton(0);
					this.config.render();	
				});
		}		
	}
	stop():void{
		if (this.status!==Status.Stop){
			this.timer.stop();
			this.notify('stop');
			this.status=Status.Stop;
		}
	}
	setupScene():void{
		var pointLight =
		  new THREE.PointLight(0xFFFFFF);
		
		// set its position
		pointLight.position.x = 10;
		pointLight.position.y = 50;
		pointLight.position.z = 130;
		
		// add to the scene
		this.config.scene.add(pointLight);
		//this.addAxis(this.config.scene,2);

		
	}
	addAxis(scene:THREE.Scene,size:number){
		var origin = new THREE.Vector3(0,0,0);
		var terminus  = new THREE.Vector3(size,0,0);
		var direction = new THREE.Vector3().subVectors(terminus, origin).normalize();
		var arrow = new THREE.ArrowHelper(direction, origin, 1, 0x884400);
		scene.add(arrow);
	}

	hideSkeleton():void{
		this.joints.forEach( (joint,i) => {
				joint.position.set(0,0,0);
		});
		this.updateJointLines();
		requestAnimationFrame( () => {
			this.config.render();
		});
		
	}
	updateJointPositions(skeleton:Skeleton):void{
		var positions:THREE.Vector3[]=skeleton.joints;
		//debugger;
		positions.forEach( (p,i) => {
				this.joints[i].position.set(p.x,p.y,p.z);
			});
	}
	updateJointLines(){
		this.jointLines.forEach( (line,i) =>{
				var lineObject:THREE.Line=this.jointLinesObjects[i];
				var positionA:THREE.Vector3= this.joints[line.jointA].position;
				var positionB:THREE.Vector3= this.joints[line.jointB].position;
				lineObject.geometry.vertices[0].set(positionA.x,positionA.y,positionA.z);
				lineObject.geometry.vertices[1].set(positionB.x,positionB.y,positionB.z);
				lineObject.geometry.dynamic=true;
    			lineObject.geometry.verticesNeedUpdate = true;
    			lineObject.geometry.normalsNeedUpdate = true;  
			});
	}
	updateSkeleton(frameNumber:number){
		var skeleton:Skeleton = this.action.frames[frameNumber];
		this.updateJointPositions(skeleton);
		this.updateJointLines();
	}
	checkUpdateSkeleton():void{
		var lastFrame:number= this.timer.lastFrame;
		var frameNumber:number = this.timer.currentFrame();
		if (this.action.frames.length <= frameNumber){
			this.stop();
			this.notify('finishedAnimation')
			if (this.loop){
				this.play();
			}
		}else{
			if (lastFrame<frameNumber){
				this.notify('frameChanged');
			}	
			this.updateSkeleton(frameNumber);
		}
	}	
	createJointSphere():THREE.Mesh{
		var material = new THREE.MeshBasicMaterial({color : 0x00ff00 });
		var sphereMaterial:THREE.MeshLambertMaterial = new THREE.MeshLambertMaterial({color: 0x00AAAA });
		var radius:number = 0.015;
	    var	segments:number = 16;
	    var	rings:number = 16;
		var sphere:THREE.Mesh = new THREE.Mesh(
		  new THREE.SphereGeometry(radius,segments,rings),sphereMaterial);
		sphere.geometry.dynamic = true;
		sphere.geometry.verticesNeedUpdate = true;
		sphere.geometry.normalsNeedUpdate = true;  
		return sphere;
	}
	
	setupSkeleton():void{
		// TODO: add 20 points, indexed
		// TODO: add lines between points
		var jointCount:number=  JointLine.kinectJointCount();
		this.joints=new Array<THREE.Mesh>(jointCount);
		for (var i=0;i<jointCount;i++){
			this.joints[i]=this.createJointSphere();
			this.config.scene.add(this.joints[i]);
		}
		this.setupJointLines();
	}
	createJointLineObject():THREE.Line{
		var material = new THREE.LineBasicMaterial({
        	color: 0xFFFFFF,linewidth: 4, 
    	});
    	var geometry = new THREE.Geometry();
	    geometry.vertices.push(new THREE.Vector3(0, 1, 0));
	    geometry.vertices.push(new THREE.Vector3(0,0,0));
	    geometry.dynamic=true;
    	geometry.verticesNeedUpdate = true;
    	geometry.normalsNeedUpdate = true;  
	    return new THREE.Line(geometry, material);
	}
	setupJointLines():void{
		this.jointLinesObjects= this.jointLines.map( j => this.createJointLineObject());
		this.jointLinesObjects.forEach( o => this.config.scene.add(o));
	}

}