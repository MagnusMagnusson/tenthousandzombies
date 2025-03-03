d3d_start();
global.firstOpen = true;
global.difficulty = 2;
global.debugMode = d3d_getDebugFormat();
global.debugCube = ModelManager().getRaw("cube",  d3d_debugCube(global.debugMode)); 
models = [
	"gun/bullet",
	"enviroment/wall",
	"enviroment/barn",
	"entities/zombie_ld",
	"entities/zombie",
	"entities/zoombie_ld",
	"entities/zoombie",
	"entities/tank_ld",
	"entities/tank"
];
ind = 0;
global.startSequence = false;
len = array_length(models);

global.opt = json_load("dat");

var char = "1234567890_-qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBN";
var uuid = "";
randomize();

for(var i = 0; i <= 10; i++){
	uuid += string_char_at(char, irandom(string_length(char)));
}

global.highscores = [];

if(!global.opt){
	global.opt = {
		"uuid" : uuid
	}
	json_save("dat", global.opt);
} else {
	global.firstOpen = false
}