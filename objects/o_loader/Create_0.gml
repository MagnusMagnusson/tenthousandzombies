d3d_start();

global.difficulty = 2;
global.debugMode = d3d_getDebugFormat();
global.debugCube = ModelManager().getRaw("cube",  d3d_debugCube(global.debugMode)); 
models = [
	"gun/bullet"
];
ind = 0;
global.startSequence = false;
len = array_length(models);
