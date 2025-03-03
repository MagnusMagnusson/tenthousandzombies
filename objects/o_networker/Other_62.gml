var _id = ds_map_find_value(async_load, "id")
var req = struct_exists(global.networking.requests, _id);
if (req){
   if (ds_map_find_value(async_load, "status") == 0){
		var _callback = global.networking.callbacks[$ _id];
		var data = ds_map_find_value(async_load, "result")
		_callback(data);
		struct_remove(global.networking.requests, _id)
		struct_remove(global.networking.callbacks,  _id)
	}
}