// Copyright (c) 2019 ml5
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

/* ===
ml5 Example
Style Transfer Mirror Example using p5.js
This uses a pre-trained model of The Great Wave off Kanagawa and Udnie (Young American Girl, The Dance)
=== */

let style;
let video;
let isTransferring = false;
let resultImg;
let model_names = ['udnie','mathura',"matta","la_muse","matilde_perez","scream","wave","wreck","rain_princess"]
let models=[];
let model_loaded_count=0;
let current_model=1;
let h=320;
let w=240;

let capture_size=[320,240]
let canvas;
function setup() {
 
  video = createCapture(VIDEO);
  video.size(capture_size[0], capture_size[1]);
  video.hide();
  // The results image from the style transfer
  resultImg = createImg('','Stylized image');
  resultImg.hide();
  select("#modal").show()

  window.addEventListener('resize', update_canvas_size);

  // Create a new Style Transfer method with a defined style.
  // We give the video as the second argument
  for (const name of model_names){    
    url='models/'.concat(name);
    print(concat("Loading model from ",url));
    models.push(ml5.styleTransfer(url, video, modelLoaded));
  }
   
}
function update_canvas_size(){
  canvas=select("#defaultCanvas0")
  print(canvas)
  canvas.width = h;
  canvas.height = w;
}
function draw(){
  image(resultImg, 0, 0, h, w);
}

function update_style_image(){
  let model_name=model_names[current_model]
  let image_url=concat("images/",model_name)
  image_url = concat(image_url,".png")
  select("#styleImage").attribute('src',image_url)
}

function next_model(){
  current_model = current_model+1 
  if (current_model >= model_names.length){
    current_model=0
  }
  update_style_image()
}
// A function to call when the model has been loaded.
function modelLoaded() {
  model_loaded_count=model_loaded_count+1
  // print(model_loaded_count)
  if (model_loaded_count == model_names.length){
    console.warn("All models loaded.")
    console.warn(window.innerHeight, window.innerWidth)
    
    canvas=createCanvas(window.innerHeight, window.innerWidth).parent('canvasContainer');
    update_canvas_size()
    // print(models)
    // print(current_model)
    select("#styleImage").mousePressed(next_model)
    update_style_image()
    select("#modal").hide()
    select('#ui').show();
    models[current_model].transfer(gotResult); 
  }
  
}

// When we get the results, update the result image src
function gotResult(err, img) {
  // print("gotResult",img)
  resultImg.attribute('src', img.src);
  models[current_model].transfer(gotResult); 
}
