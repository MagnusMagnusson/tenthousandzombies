d3d_start();

global.debugMode = d3d_getDebugFormat();
global.debugCube = ModelManager().getRaw("cube",  d3d_debugCube(global.debugMode)); 
models = [
];
ind = 0;
global.startSequence = false;
len = array_length(models);
