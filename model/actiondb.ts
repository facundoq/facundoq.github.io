/// <reference path="action.ts" />
/// <reference path="../jquery.d.ts" />
/// <reference path="../underscore.d.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="../three/three.ts" />

class ActionLoader{
	
	
	load(actionString:string,id:ActionIdentifier):Action{
		return new Action(this.getSkeletonFrames(actionString),id);	
	}
	getSkeletonFrames(actionString:string):Skeleton[]{
		var lines:string[]= actionString.split("\n");
		lines.pop(); // remove last line
		return lines.map( this.lineToSkeleton);		
	}
	lineToSkeleton(line:string):Skeleton{
		var coordinateStrings:string[]=line.split(",");
		var coordinates:number[]= coordinateStrings.map(parseFloat);
		var vectorCount:number=coordinates.length/3;
		var joints:THREE.Vector3[]=new Array<THREE.Vector3>(vectorCount);
		for (var i=0;i<vectorCount;i++){
			var x:number=coordinates[i*3+0];
			var y:number=coordinates[i*3+1];
			var z:number=coordinates[i*3+2];
			joints[i]= new THREE.Vector3(x,y,z);
		}
		return new Skeleton(joints);
	}
}


class ActionMovement{
	id:ActionIdentifier;
	movement:number[];
	constructor(id:ActionIdentifier,movement:number[]){
		this.id=id;
		this.movement=movement;
	}
}


class ActionDB{
	folderPath:string;
	actionCountsByTypeAndSubject:number[][];
	ids:ActionIdentifier[];
	actionMovements: { [id: string] : ActionMovement; } ;

	constructor(folderPath:string,callback:Function){
		this.folderPath=folderPath;
		this.loadIndexFile( () => {
			this.loadMovementFile(callback);
			});

	}
	loadMovementFile(callback:Function):void{
		var movementFilePath:string=this.folderPath+"movement.csv";
		var f:Function= s => {
			this.actionMovements=this.parseMovementFile(s);
			callback();
		};
		this.getFileContents(movementFilePath,f); 

	}
	parseMovementFile(s:string): { [id: string] : ActionMovement; } {
		
		var lines:string[]=s.split("\n");
		var movements:ActionMovement[]=lines.map(l =>{
			var fields:number[]= l.split(",").map( f =>  parseFloat(f));
			var id:ActionIdentifier= new ActionIdentifier(fields[0],fields[1],fields[2]);
			return new ActionMovement(id,fields.splice(3));
		});
		var actionMovements: { [id: string] : ActionMovement; } ={};		
		movements.forEach( m  => {actionMovements[m.id.toString()]= m;});
		return actionMovements;
	}

	classCount():number{
		if (this.actionCountsByTypeAndSubject==null){
			return 0;
		}else{
			return this.actionCountsByTypeAndSubject.length;
		}
	}
	subjectCount():number{
		if (this.actionCountsByTypeAndSubject==null){
			return 0;
		}else{
			if (this.actionCountsByTypeAndSubject[0]==null){
				return 0;
			}else{
				return this.actionCountsByTypeAndSubject[0].length;
			}
		}
	}
	isValid(id:ActionIdentifier):boolean{
		return id.repetition<=this.actionCountsByTypeAndSubject[id.type][id.subject];
	}
	
	getAction(id:ActionIdentifier,callback:Function):void{
		if (!this.isValid(id)) {throw new Error("Invalid ActionIdentifier "+id); }
		
		var path:string=this.getPathForAction(this.folderPath,id);
		var loader:ActionLoader=new ActionLoader();
		
		var f:Function=(actionString) => callback( loader.load(actionString,id) );
		this.getFileContents(path, f);
	}
	
	getPathForAction(folderPath:string,id:ActionIdentifier):string{

		var filename:string="c"+id.type+"_s_"+id.subject+"_r_"+id.repetition+".csv";
		return folderPath+filename;
	}
	getFileContents(path:string,callback:Function):void{		
		$.ajax({
	    	url : path,
	    	success : (data: any, textStatus: string, jqXHR: JQueryXHR) =>
	    	 { callback(data) }
		});
	}
	
	private loadIndexFile(callback:Function){
		var indexFilePath:string=this.folderPath+"count.csv";
		var f:Function= s => {
			this.actionCountsByTypeAndSubject=this.parseIndexFile(s);
			this.ids = this.generateAllIDs();
			callback();
		};
		this.getFileContents(indexFilePath,f); 
	}
	
	parseIndexFile(contents:string):number[][]{
		var entries:IndexFileEntry[]=this.getEntries(contents);
		var types:number[]=entries.map(e => e.type);
		var subjects:number[]=entries.map(e => e.subject);
		return this.generateCountMatrix(entries,types,subjects);
	}
	generateCountMatrix(entries:IndexFileEntry[],types:number[],subjects:number[]):number[][]{
		var typeCount:number=_.max(types);
		var subjectCount:number=_.max(subjects);
		var counts:number[][]= create2DArray(typeCount+1,subjectCount+1);
		entries.forEach( e => {counts[e.type][e.subject] = e.repetitions});
		return counts;
	}
	
	getEntries(contents:String):IndexFileEntry[]{
		var lines:string[]= contents.split("\n");
		lines.shift();
		lines.pop();
		var entries:IndexFileEntry[] =lines.map(line => {
			var vars:string[]=line.split(",");
			var type:number=+vars[0];
			var subject:number=+vars[1];
			var repetitions:number=+vars[2];
			return new IndexFileEntry(type,subject,repetitions);
		} );
		return entries;
	}
	generateAllIDs():ActionIdentifier[]{
		var result:ActionIdentifier[]=[];
		var classCount:number=this.classCount();
		var subjectCount:number=this.subjectCount();
		this.ids=[];
		for (var c=0;c<classCount;c++){
			for (var s=0;s<subjectCount;s++){
				var repetitions:number=this.actionCountsByTypeAndSubject[c][s];
				for (var r=1;r<repetitions;r++){
					result.push(new ActionIdentifier(c,s,r));
				}
			}
		}
		return result;
	}
	indicesOfActionsFor(classes:number[],subjects:number[]):number[]{
		var indices:number[]=[];
		this.ids.forEach( (id,i) => {
			if ( $.inArray(id.type,classes)!=-1 && $.inArray(id.subject,subjects)!=-1 ){
				indices.push(i);
			}
		});
		return indices;
	}

	actionIdentifiersFor(classes:number[],subjects:number[]):ActionIdentifier[]{
		var indices:ActionIdentifier[]=[];
		this.ids.forEach( (id,i) => {
			if ( $.inArray(id.type,classes)!=-1 && $.inArray(id.subject,subjects)!=-1 ){
				indices.push(id);
			}
		});
		return indices;
	}
	movementsFor(ids:ActionIdentifier[]):ActionMovement[]{
		return ids.map( id => this.actionMovements[id.toString()] );
	}
	rawMovementsFor(ids:ActionIdentifier[]):number[][]{
		return this.movementsFor(ids).map( m => { 
			var data= m.movement.slice(0);
			data.unshift(m.id.type);
			return data;
		});
	}
	
}

class IndexFileEntry{
	type:number;
	subject:number;
	repetitions:number;
	constructor(type:number,subject:number,repetitions:number){
		this.type=type;
		this.subject=subject;
		this.repetitions=repetitions;
	}
	
		
}