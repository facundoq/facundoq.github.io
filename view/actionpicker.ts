/// <reference path="../jquery.d.ts" />
/// <reference path="../model/actiondb.ts" />
/// <reference path="../model/action.ts" />
/// <reference path="../util/util.ts" />
/// <reference path="picker.ts" />

class ActionPicker extends ObservableObject{
    classPicker:Picker;
    subjectPicker:Picker;
    repetitionPicker:Picker;
    actionDB:ActionDB

    constructor(actionDB:ActionDB){
        super();
        this.actionDB=actionDB;
        this.classPicker=new Picker( $('#classPicker'),false) ;
        this.classPicker.setNumbersAsElements(actionDB.classCount());
        this.classPicker.setTooltips(KinectDatabase.classNames());
        this.classPicker.setColors( KinectDatabase.classColors());

        this.subjectPicker=new Picker( $('#subjectPicker'),false);
        this.subjectPicker.setNumbersAsElements(actionDB.subjectCount());
        this.repetitionPicker=new Picker( $('#repetitionPicker'),true);

        this.subjectPicker.registerCallback( this, 'selectionChanged', () => {this.filterRepetitions()});
        this.classPicker.registerCallback( this, 'selectionChanged', () => {this.filterRepetitions()});
        this.repetitionPicker.registerCallback( this, 'selectionChanged', () =>  {this.changePlayingItem()});
        this.filterRepetitions();
    }

    changePlayingItem():void{
        if (this.actionSelected()){
            //this.autoScrollRepetitionPicker();
            this.notify('actionSelected');
        }else{
            this.notify('actionUnselected');
        }
    }
    
    validSelection():boolean{
        var classes:number[]=this.classPicker.selectedElements();
        var subjects:number[]=this.subjectPicker.selectedElements();
        return classes.length>0 && subjects.length>0;
    }
    actionSelected():boolean{
        return this.repetitionPicker.selectedIndices().length>0;
    }

    autoScrollRepetitionPicker():void{
        var selected:number[]=this.repetitionPicker.selectedIndices();
        if (selected.length>0){
            var li:JQuery= $(this.repetitionPicker.getElements()[selected[0]]);
            this.repetitionPicker.list.scrollTop(li.position().top);
        }
    }
    filterRepetitions():void{
        var classes:number[]=this.classPicker.selectedElements();
        var subjects:number[]=this.subjectPicker.selectedElements();
        if ( classes.length>0 && subjects.length>0){
            //var indices:number[]= this.indicesOfActionsFor(classes,subjects);
            var actionIdentifiers:ActionIdentifier[]=this.actionDB.actionIdentifiersFor(classes,subjects);
            var texts:string[]=actionIdentifiers.map( id => {return "s"+id.subject+"r"+id.repetition;});
            this.repetitionPicker.setElementsWithLabels(actionIdentifiers,texts);
            var classColors:string[]=KinectDatabase.classColors();
            var colors = actionIdentifiers.map( id => {return classColors[id.type-1 ]; debugger;})
            this.repetitionPicker.setColors(colors);
            this.repetitionPicker.selectNone();
            this.notify('filterChanged');
        }else{
            this.repetitionPicker.selectNone();
            this.repetitionPicker.showElements([]);
            this.notify('invalidFilter');
        }
        this.notify('actionUnselected');

    }


}