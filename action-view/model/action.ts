/// <reference path="../three/three.ts" />

class KinectDatabase{

	static classNames():string[]{
		var names:string[]=[ "Raise outstretched arms", "Crouch", "Swipe right", "Put on goggles", "Circle with both hands",
			 "Shoot", "Bow", "Throw an object", "Raise hands", "Change weapon", "Beat the air with both your hands" , "Kick" ];
			 return names;
	}
    static classColors():string[]{
        return ["#1f4464","#ff7f0e","#1c901c","#d62728","#9467bd","#8c564b","#e377c2","#7f7f7f","#bcbd22","#17aeef","#23FF89","#FF0012"];
    }
    static jointNames():string[]{
        var names:string[]=[
                            "SpineBase"
                             ,"SpineMid"
                             ,"Neck"
                             ,"Head"
                             ,"ShoulderLeft"
                             ,"ElbowLeft"
                             ,"WristLeft"
                             ,"HandLeft"
                             ,"ShoulderRight"
                             ,"ElbowRight "
                             ,"WristRight"
                             ,"HandRight"
                             ,"HipLeft"
                             ,"KneeLeft"
                             ,"AnkleLeft"
                             ,"FootLeft"
                             ,"HipRight"
                             ,"KneeRight"
                             ,"AnkleRight"
                             ,"FootRight"
                            ];
             return names;
    }

}

class ActionIdentifier{
	type:number;
	subject:number;
	repetition:number;
	
	constructor(type:number,subject:number,repetition:number){
		this.type=type;
		this.subject=subject;
		this.repetition=repetition;
	}
	jointCount():number{
		return 20;	
	}
	toString():string{
		return "c"+this.type+"s"+this.subject+"r"+this.repetition;
	}
	
}
class Action{
	id:ActionIdentifier;
	frames:Skeleton[];
	constructor(frames:Skeleton[],id:ActionIdentifier){
		this.frames=frames;
		this.id=id;
	}	
}

class Skeleton{
	joints:THREE.Vector3[];
	constructor(joints:THREE.Vector3[]){
		this.joints=joints;
	}
	
}

class Position3D{
	z:number;
	x:number;
	y:number;
	
	constructor(x:number,y:number,z:number){
		this.x=x;
		this.y=y;
		this.z=z;
	}
	
}


