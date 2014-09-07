class ThreeJSConfig{
	scene:any;
	camera:any;
	renderer:any;
	constructor(scene:any,camera:any,renderer:any){
		this.scene=scene;
		this.camera=camera;
		this.renderer=renderer;
	}
	
	render():void{
		this.renderer.render(this.scene, this.camera);
	}
	
}



// should refactor this someday
function setCanvasSize(config:ThreeJSConfig,canvas:JQuery):void{
	canvas.width(window.innerWidth/2);
	canvas.height(window.innerHeight-200);
	var size:Size= Size.sizeOfJQueryObject(canvas);
	config.camera.aspect = size.width/size.height;
    config.camera.updateProjectionMatrix();
	config.renderer.setSize(size.width, size.height);
}

function initializeThreeJS(canvas:JQuery):ThreeJSConfig{
	//canvas=$(document.body);
	var scene = new THREE.Scene();
	var camera = new THREE.PerspectiveCamera(75, 1, 0.1, 1000);
	var renderer = new THREE.WebGLRenderer();
	var config:ThreeJSConfig = new ThreeJSConfig(scene,camera,renderer);
	canvas[0].appendChild(renderer.domElement);
	//camera.rotation.y = 180 * Math.PI / 180
	camera.position.z = 4.42;
	setCanvasSize(config,canvas);
	return config;
}

function testThreeJS(config:ThreeJSConfig):void{
	
	var render = function() {
		requestAnimationFrame(render);
		config.renderer.render(config.scene, config.camera);
	};
	render();
}


function setUpResizeHandler():void{
	$( window ).resize(function() {
		setCanvasSize(config,canvas);
	});
}
