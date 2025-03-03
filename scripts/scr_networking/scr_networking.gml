#macro ISPROD false
#macro PRODSERVER "https://gmcjam.mmagnusson.net/jam55/api/"
#macro DEVSERVER "http://127.0.0.1:3030/jam55/api/"
#macro SERVER (ISPROD ? PRODSERVER : DEVSERVER)


global.networking = {
	address : -1,
	requests : {},
	callbacks : {},
};

function network_init(){
	global.networking.address = SERVER;
	global.networking.headers = boilerPlateHeaders();
}

function fetch(url, callback){
	show_debug_message("Sending request to " + url);
	var ping = http_get(url);
	show_debug_message(ping);
	global.networking.requests[$ ping] = true;
	global.networking.callbacks[$ ping] = callback;
}

function highscores_post(uid, name, _score, difficulty){
		var body = {
			"uid" : uid,
			"name":name,
			"score":_score,
			"difficulty": difficulty
		}
		var b = json_stringify(body);
		show_debug_message(b);
		http_request(global.networking.address + "scores","POST",global.networking.headers , b)
}

function highscores_get(callback){
	fetch(string(global.networking.address) + "scores", callback);
}


function boilerPlateHeaders(){
	var map = ds_map_create();
	ds_map_add(map, "Connection", "close");
	ds_map_add(map, "Cache-Control", "max-age=0");
	return map
}