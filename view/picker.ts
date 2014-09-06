/// <reference path="../jquery.d.ts" />
/// <reference path="../util/util.ts" />

class Picker extends ObservableObject{
    element:JQuery;
    selectAllButton:JQuery;
    selectNoneButton:JQuery;
    list:JQuery;
    elements:JQuery;
    single:boolean;
    objects:any[];

    constructor(element:JQuery,single:boolean){
        super();
        this.single=single;
        this.element=element;
        this.list=element.find('ol');
        this.selectAllButton=element.find('.selectAll');
        this.selectNoneButton=element.find('.selectNone');

        this.selectAllButton.button();
        this.selectNoneButton.button();
        this.elements=$();
        this.selectNoneButton.click(() =>{
            this.selectNone();
            this.notifySelectionChange();
        });
        this.selectAllButton.click(() =>{
            this.selectAll();   
            this.notifySelectionChange();
        });
        var options:any={
            filter: 'li', 
            selected: (e,ui) => { 
                if (this.single){
                    $(ui.selected).addClass("ui-selected").siblings().removeClass("ui-selected");
                }
                this.notifySelectionChange();
            }
        };
        if (this.single){
            this.selectAllButton.hide();
            this.selectNoneButton.hide();
        }
        this.list.selectable(options);
    }
    notifySelectionChange(){
        this.notify('selectionChanged');
    }
    selectNone():void{
        this.getElements().removeClass('ui-selected');
    }
    selectAll():void{
        this.getElements().addClass('ui-selected');
    }
    setNumbersAsElements(count:number):void{
        var numbers:number[]=_.range(1,count);
        this.setElements(numbers);
    }
    setTooltips(tooltips:string[]){
        this.elements.each( (i,e) => 
            {$(e).attr('title',tooltips[i]);}
         );
    }
    setElementsWithLabels(objects:any[],labels:string[]):void{
        this.objects=objects;
        this.list.empty();
        for (var i=0;i<labels.length;i++){
            var e:JQuery = $('<li class="ui-state-default">'+labels[i]+'</li>');
            this.list.append(e);
        }
        this.elements=this.list.find('li');
        this.setupElements();
        this.notifySelectionChange();
    }
    setElements(objects:any[]):void{
        this.setElementsWithLabels(objects,objects);
    }
    showElements(indices:number[]):void{
        var elements:JQuery=this.getElements();
         elements.hide();
         indices.forEach( i => $(elements[i]).show() );
        this.notifySelectionChange();
    }
    setupElements():void{
        // this.getElements().each( (i,e) => {
        //  $(e).click(() => {
        //      this.notifySelectionChange();
        //  });
        // });
    }

    getElements():JQuery{
        //return this.list.find('li');
        return this.elements;
    }
    selectElement(index:number):void{
        this.selectNone();
        $(this.getElements()[index]).addClass('ui-selected');
        this.notifySelectionChange();
    }
    selectedElement():any{
        var indices:number[]=this.selectedIndices();

        return this.objects[indices[0]];
    }
    selectedElements():any[]{
        return this.selectedIndices().map( i => this.objects[i]);
    }
    selectedIndices():number[]{
        var indices:number[]=[];
        var elements:JQuery=this.getElements();
        for (var i=0;i<elements.length;i++){
            var e:JQuery=$(elements[i]);
            if (e.is(':visible') && e.hasClass('ui-selected')){
                indices.push(i);
            }
        }
        return indices;
    }

    setColors(colors:string[]){
        this.getElements().each( (i,e) => {
            $(e).css("background-color", colors[i]);
        });
    }
}
