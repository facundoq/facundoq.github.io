var ThreeJSConfig = (function () {
    function ThreeJSConfig(scene, camera, renderer) {
        this.scene = scene;
        this.camera = camera;
        this.renderer = renderer;
    }
    ThreeJSConfig.prototype.render = function () {
        this.renderer.render(this.scene, this.camera);
    };
    return ThreeJSConfig;
})();

// should refactor this someday
function setCanvasSize(config, canvas) {
    canvas.width(window.innerWidth / 2);
    canvas.height(window.innerHeight - 200);
    var size = Size.sizeOfJQueryObject(canvas);
    config.camera.aspect = size.width / size.height;
    config.camera.updateProjectionMatrix();
    config.renderer.setSize(size.width, size.height);
}

function initializeThreeJS(canvas) {
    //canvas=$(document.body);
    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, 1, 0.1, 1000);
    var renderer = new THREE.WebGLRenderer();
    var config = new ThreeJSConfig(scene, camera, renderer);
    canvas[0].appendChild(renderer.domElement);

    //camera.rotation.y = 180 * Math.PI / 180
    camera.position.z = 4.42;
    setCanvasSize(config, canvas);
    return config;
}

function testThreeJS(config) {
    var render = function () {
        requestAnimationFrame(render);
        config.renderer.render(config.scene, config.camera);
    };
    render();
}

function setUpResizeHandler() {
    $(window).resize(function () {
        setCanvasSize(config, canvas);
    });
}
