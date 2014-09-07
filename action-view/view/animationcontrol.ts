/// <reference path="../jquery.d.ts" />
/// <reference path="../animator/ActionAnimator.ts" />
/// <reference path="../model/actiondb.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="picker.ts" />
/// <reference path="actionpicker.ts" />



class AnimationControl{

    current:number;
    play:JQuery;
    pause:JQuery;
    stop:JQuery;
    loop:JQuery;
    element:JQuery;
    progressBar:JQuery;
    actionIdentifier:JQuery;
    actionAnimator:ActionAnimator;
    actionAnimatorAdapter:ObservableObjectAdapter;
    ap:ActionPicker;
    apAdapter:ObservableObjectAdapter;
    actionDB:ActionDB;
    playLabel:string='|>';
    pauseLabel:string='||';
    rewindLabel:string='<<';
    constructor(id:string, actionAnimator:ActionAnimator,ap:ActionPicker,actionDB:ActionDB){
        this.element=$(id);
        this.ap=ap;
        this.apAdapter=new ObservableObjectAdapter(ap);
        this.actionDB=actionDB;
        this.progressBar=$('#progressbar');
        this.progressBar.progressbar({ value: 0 });
        this.actionIdentifier=$('#actionIdentifier');
        this.actionIdentifier.text('No action selected.');
        this.actionAnimator=actionAnimator;
        this.actionAnimatorAdapter=new ObservableObjectAdapter(actionAnimator);
        this.addButtons();
        this.setupEventListeners();
    }
    
    setupEventListeners():void{
        this.actionAnimatorAdapter.registerCallback(this,'play',()=>{
            this.stop.prop("disabled", false);
            this.play.prop("disabled", false);
            this.play.button("option",'label',this.pauseLabel);
        });

        this.actionAnimatorAdapter.registerCallback(this,'pause',()=>{
            this.stop.prop("disabled", false);
            this.play.prop("disabled", false);
            this.play.button("option",'label',this.playLabel);
        });

        this.actionAnimatorAdapter.registerCallback(this,'notReady',()=>{
            this.stop.prop("disabled", true);
            this.play.prop("disabled", true);
            this.play.button("option",'label',this.playLabel);
            this.progressBar.progressbar({ value: 0 });
            this.actionIdentifier.text('No action selected.');
            this.updateTimeLabel();
        });
        this.actionAnimatorAdapter.registerCallback(this,'finishedAnimation',()=>{
            if(!actionAnimator.loop){
                var indices:number[]=this.ap.repetitionPicker.selectedIndices();
                var index:number=indices[0];
                if (index<this.ap.repetitionPicker.objects.length ){
                    this.ap.repetitionPicker.selectElement(index+1);
                }
                
            }
        });
        
        this.apAdapter.registerCallback(this,'actionSelected',() =>{
            this.playSelectedAction();
        });
        this.apAdapter.registerCallback(this,'actionSelected',() =>{
            this.actionAnimator.stop();
            this.actionAnimator.clearAction();
        });

        this.apAdapter.registerCallback(this,'actionUnselected',() =>{
            this.actionAnimator.stop();
            this.actionAnimator.clearAction();
        });

        this.actionAnimatorAdapter.registerCallback(this,'actionSet',()=>{
            this.stop.prop("disabled", true);
            this.play.prop("disabled", false);
            this.play.button("option",'label',this.playLabel);
            this.progressBar.progressbar({ value: 0 });
            var action:Action=this.actionAnimator.action;
            this.actionIdentifier.text('Action: '+action.id.toString());
            this.updateTimeLabel();
        });

        this.actionAnimatorAdapter.registerCallback(this,'stop',()=>{
            this.stop.prop("disabled", true);
            this.play.prop("disabled", false);
            this.play.button("option",'label',this.playLabel);
            this.progressBar.progressbar({ value: 0 });
        });
        this.actionAnimatorAdapter.registerCallback(this,'frameChanged',()=>{
            var p:number= this.actionAnimator.timer.currentFrame()/this.actionAnimator.action.frames.length;
            p=Math.round(p*100);
            this.progressBar.progressbar({ value: p });
            this.updateTimeLabel();
        });

        this.actionAnimator.registerCallback(this,'loopChanged',()=>{
            this.updateLoopStatus();
        });

    }
    loadSelectedAction(callback:Function):void{
        var actionIdentifier:ActionIdentifier=<ActionIdentifier> this.ap.repetitionPicker.selectedElement();
            this.actionAnimator.stop();
            this.actionDB.getAction(actionIdentifier, action => {
                this.actionAnimator.setAction(action);
                callback();
            });
    }
    playSelectedAction():void{
        this.loadSelectedAction(() => {this.actionAnimator.play();});
    }
    updateLoopStatus(){
        if (this.actionAnimator.loop){
            this.loop.button("option",'label','Mode:Loop');
        }else{
            this.loop.button("option",'label',"Mode:Next");
        }
    }
    
    disablePlayStop():void{
        this.play.prop("disabled", true);
        this.stop.prop("disabled", true);
    }
    disableAll():void{
        this.disablePlayStop();
    }
    updateEnabledElements(actionAnimator:ActionAnimator):void{
        this.disablePlayStop();
    }

    setupButtons(){
        this.play=$('#play');
        this.stop=$('#stop');
        this.loop=$('#loop');
    }

    updatePlayStatus(){
        if (this.actionAnimator.status==Status.Play){
            this.play.button("option",'label',this.pauseLabel);     
        }else{
            this.play.button("option",'label',this.playLabel);      
        }
    }
    addButtons():void{
        this.setupButtons();
        this.play.button();
        this.updatePlayStatus();
        this.play.click(() => {
                if (this.actionAnimator.status==Status.Play){
                    this.actionAnimator.pause();
                }else{
                    this.actionAnimator.play();
                }
            } );

        this.stop.button();
        this.play.text();
        this.stop.click(() => {
            this.actionAnimator.stop();
            this.actionAnimator.play();
        });
        this.stop.button("option",'label',this.rewindLabel);        

        this.stop.prop("disabled", true);
        this.play.prop("disabled", true);

        this.loop.button();
        this.updateLoopStatus();
        this.loop.click(() => this.actionAnimator.toggleLoop());
        $(document).tooltip({  show: {
            delay: 750
            }});
    }
    updateTimeLabel():void{
        if (this.actionAnimator.action != null){
            var totalFrames:number=this.actionAnimator.action.frames.length;
            var currentFrame:number=this.actionAnimator.timer.lastFrame;
            $('#timeLabel').text(currentFrame+"/"+totalFrames);
        }else{
            $('#timeLabel').text('0/0');
        }
    }

    activate():void{
        this.apAdapter.paused=false;
        this.actionAnimatorAdapter.paused=false;
        if (this.ap.actionSelected()){
            this.loadSelectedAction( () => {});
        }else{
            this.actionAnimator.clearAction();
            this.ap.repetitionPicker.selectNone();        
        }
        
    }
    deactivate():void{
        this.actionAnimator.stop();
        this.actionAnimator.clearAction();

        this.apAdapter.paused=true;
        this.actionAnimatorAdapter.paused=true;
    }

}