/// <reference path="../d3.d.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../model/actiondb.ts" />

class StatisticsControl{

    ap:ActionPicker;
    apAdapter:ObservableObjectAdapter;
    actionDB:ActionDB;
    element:JQuery;
    parallel:any;
    data:any[];

    constructor(id:string, ap:ActionPicker,actionDB:ActionDB){
        this.element=$(id);
        this.ap=ap;
        this.apAdapter=new ObservableObjectAdapter(ap);
        this.actionDB=actionDB;
        this.setupEventListeners();
    }
    highlightSelectedAction():void{
        var id:ActionIdentifier=this.ap.repetitionPicker.selectedElement();
            var data:any[]=this.transformData(this.actionDB.rawMovementsFor([id]));
            this.parallel.highlight(data);
    }
    setupEventListeners():void{
        
        this.apAdapter.registerCallback(this,'actionSelected',() =>{
            this.highlightSelectedAction();
        });

        this.apAdapter.registerCallback(this,'actionUnselected',() =>{
                this.getParallel().unhighlight();
        });
        
        
        this.apAdapter.registerCallback(this,'filterChanged',() =>{
            this.displayInformation();
        });
        this.apAdapter.registerCallback(this,'invalidFilter',() =>{
            this.getParallel().data([])
              .render()
              //.createAxes();
        });
    }
    displayInformation():void{
        var ids:ActionIdentifier[]=this.ap.repetitionPicker.objects;
        this.data=this.transformData(this.actionDB.rawMovementsFor(ids));
        var alpha:number = Math.max(1000/Math.sqrt(this.data.length),0.01);
        this.getParallel().data(this.data)
          .render()
          .shadows()
          //.brushable()
          .updateAxes()
          .autoscale()
          //.ticks([0,0.005,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08])
          .alpha(alpha)
          .render();
          //this.getParallel().axisDots();
          //d3.selectAll(".tick > text").style("font-size", 10);
    }
    header():string[]{
        var header:string[]=['class'];
        return header.concat(KinectDatabase.jointNames());
    }
    jointsToShow():number[]{
        return [0,1,3,7,11,15,19];
    }
    transformData(data:number[][]):any[]{
        var header:string[]=this.header();
        var result:any[]=[];
        var jointsToShow:number[]=this.jointsToShow();
        for (var i=0;i< data.length;i++){
            var row:number[]=data[i];
            var newRow: { [id: string] : number; }={};
            row.forEach( (r,i )=> {
                if (i==0 || _.include(jointsToShow,i-1)){
                    newRow[header[i]]=r;
                }
             });;
            result.push(newRow);
        }

        return result;
    }

    parallelPrototype():any{
        var parallel=d3.parcoords()("#parallel");
        //var class_colors = d3.scale.ordinal().domain([1,12]).range( KinectDatabase.classColors());
        var class_colors:string[]=KinectDatabase.classColors();
        var color = (d) => { 
            return class_colors[d['class']-1]; 
        };

        parallel= parallel.color(color).alpha(0.3).ticks(4).mode("queue");
        d3.selectAll(".tick > text").style("font-size", 10);
        return parallel;

    }
    getParallel():any{
        if (this.parallel==null){
            this.parallel=this.parallelPrototype();
        }
        return this.parallel;
    }
    activate():void{
        this.apAdapter.paused=false;
        if (this.ap.validSelection()){
            this.displayInformation();
            if (this.ap.actionSelected()){
                this.highlightSelectedAction();
            }
        }

    }
    deactivate():void{
        this.apAdapter.paused=true;
    }

}
