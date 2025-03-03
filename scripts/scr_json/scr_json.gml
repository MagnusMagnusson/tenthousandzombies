function json_load(file){
	try{    
		var existing_buffer = buffer_load(file);
	    if (existing_buffer != -1) {
	        var json = buffer_read(existing_buffer, buffer_string);
	        buffer_delete(existing_buffer)
	        return json_parse(json);
	    } else{
			return false;
		}
	} catch(ex){
		show_debug_message("Failed to load json file " + string(file));
		show_debug_message(ex);
		return false;
	}
}

function json_save(file, data){
	try{	
		var json = json_stringify(data);
		var buffer = buffer_create(1, buffer_grow, 1);
	    buffer_write(buffer, buffer_string, json);
	    buffer_save(buffer, file);
	    buffer_delete(buffer);
	} catch(ex){		
		show_debug_message("Failed to save json file " + string(file));
		show_debug_message(ex);
	}
}