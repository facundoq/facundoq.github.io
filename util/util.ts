/// <reference path="../jquery.d.ts" />

class Size{
	width:number;
	height:number;
	constructor(width:number,height:number){
		this.width=width;
		this.height=height;
	}
	public static sizeOfElement(id:String):Size{
		return Size.sizeOfJQueryObject($(id));
    }
	public static sizeOfJQueryObject(object:JQuery):Size{
		return new Size(object.width(),object.height());
    }
}


function create2DArray(rows:number,columns:number):number[][] {
    var x:Array<Array<number>>=new Array<Array<number>>(rows);
    for (var i=0;i<rows;i++){
    	x[i]=new Array<number>(columns);
    }
	return x;
}

//function max(a:number[]):number{

//}


interface Observer {
    observe(event:string);
}

interface Observable{
	//registerObserver(observer:Observer,event:string ) : void;
	registerCallback(observer:any,event:string,callback:Function ) : void;
	unregisterCallbacks(observer :any,event:string) : void;
	notify(event:string);
}

class ObjectCallback{
	object:any;
	callback:Function;
	
	constructor(object:any,callback:Function){
		this.object=object;
		this.callback=callback;
	}
}

class ObservableObject { // or Interface

    callbacks :  { [id: string]: ObjectCallback[]; };

    constructor() {
        this.callbacks={};
    }

    registerCallback(observer:any,event:string,callback:Function ) : void{
      var oa:ObjectCallback=new ObjectCallback(observer,callback);
        if(this.callbacks[event] === undefined){
            this.callbacks[event]=[oa];
        }else{
            this.callbacks[event].push(oa);
        }
    }

    unregisterCallbacks(observer : any,event:string) : void {
      var callbacks:ObjectCallback[]=this.callbacks[event];
        if(callbacks !== undefined){
           var indices:number[]=[];

           for (var i=0;i<callbacks.length;i++){
             if (callbacks[i].object === observer ){
              indices.push(i);
             }
           }
           for (var i=indices.length-1;i>=0;i--){
             callbacks.splice(indices[i],1);
           }
        }
    }

    notify(event:string) : void {
      var callbacks:ObjectCallback[]=this.callbacks[event];
        if(callbacks !== undefined){
          callbacks.forEach(c => c.callback());
        }
    }

}


class ObservableObjectAdapter { 
    paused:boolean;
    object:ObservableObject;
    constructor(object:ObservableObject) {
        this.paused=false;
        this.object=object;

    }


    registerCallback(observer:any,event:string,callback:Function ) : void{
      this.object.registerCallback(this,event,() => {
          if (!this.paused){
            callback();
          }
        });
    }

    unregisterCallbacks(observer : any,event:string) : void {
      this.object.unregisterCallbacks(this,event);
    }

}