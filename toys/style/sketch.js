
let video;
let loading = true;
let resultImg;
let model_names = ['udnie','mathura',"matta","la_muse","matilde_perez","scream","wave","wreck","rain_princess"]
let models={};
// let model_loaded_count=0;
let current_model=0;
let h=320;
let w=240;

let capture_size=[320,240]


function setup() {
  // Video capture, only using p5.js for this
  video = createCapture(VIDEO);
  video.size(capture_size[0], capture_size[1]);
  video.hide();
  // UI setup
  select("#styleButton").mousePressed(next_model);
  // Load model
  load_current_model()
}

function load_current_model(){
  // load the current model
  update_style_image()
  model_name=model_names[current_model]
  if (!models.hasOwnProperty(model_name)){
    // only download if not already loaded in `models`
    select("#modal").show()
    select("#ui").hide()
    load_model(model_name,model_loaded)
  }
}

function model_loaded(){
  // hide "loading.." modal, show normal ui and start applying style transfer 
  // to input video
  select("#modal").hide()
  select("#ui").show()
  start_transfer()
}

function load_model(name,callback){
  // load a model, save it in `models` and then call callback
  url='models/'.concat(name);
  print(concat("Loading model from ",url));
  loading = true;
  function intermediate_callback(){
    loading=false;
    callback();
  }
  models[name]=ml5.styleTransfer(url, video, intermediate_callback);
}


function update_style_image(){
  // update the name and image of the style selector
  let model_name=model_names[current_model]
  let image_url=concat("images/",model_name)
  image_url = concat(image_url,".png")
  select("#styleImage").attribute('src',image_url)
  select("#styleName").html(model_name)
}

function next_model(){
  
  current_model = current_model+1 
  // loop around
  if (current_model >= model_names.length){
    current_model=0
  }
  load_current_model()
}


function get_current_model(){
  // assumes model is already loaded
  return models[model_names[current_model]]
}

function start_transfer(){
  get_current_model().transfer(gotResult); 
}

function gotResult(err, img) {
  // When we get the results, update the result image src
  select("#image").attribute('src',img.src)
  if (!loading){
    get_current_model().transfer(gotResult); 
  }
}
