function d3d_start(){
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);

	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	global.format = vertex_format_end();
}

function d3d_end(){
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	global.format = undefined;
}

function d3d_getDebugFormat(){
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_color();
	return vertex_format_end();
}

function d3d_debugCube(debugFormat){
	var model = vertex_create_buffer();
	vertex_begin(model, global.debugMode);
	
	var vertices = [
	    [0, 0, 0], [1, 0, 0], [1, 1, 0],  // Front face, Triangle 1
	    [0, 0, 0], [1, 1, 0], [0, 1, 0],  // Front face, Triangle 2

	    [0, 0, 1], [1, 0, 1], [1, 1, 1],  // Back face, Triangle 3
	    [0, 0, 1], [1, 1, 1], [0, 1, 1],  // Back face, Triangle 4

	    [0, 0, 0], [0, 1, 0], [0, 1, 1],  // Left face, Triangle 5
	    [0, 0, 0], [0, 1, 1], [0, 0, 1],  // Left face, Triangle 6

	    [1, 0, 0], [1, 1, 0], [1, 1, 1],  // Right face, Triangle 7
	    [1, 0, 0], [1, 1, 1], [1, 0, 1],  // Right face, Triangle 8

	    [0, 0, 0], [1, 0, 0], [1, 0, 1],  // Bottom face, Triangle 9
	    [0, 0, 0], [1, 0, 1], [0, 0, 1],  // Bottom face, Triangle 10

	    [0, 1, 0], [1, 1, 0], [1, 1, 1],  // Top face, Triangle 11
	    [0, 1, 0], [1, 1, 1], [0, 1, 1]   // Top face, Triangle 12
	];

	for (var i = 0; i < array_length(vertices); i += 3) {
	    vertex_position_3d(model, vertices[i][0], vertices[i][1], vertices[i][2]);
	    vertex_color(model, c_gray, 1);
	    vertex_position_3d(model, vertices[i + 1][0], vertices[i + 1][1], vertices[i + 1][2]);
	    vertex_color(model, c_gray, 1);
	    vertex_position_3d(model, vertices[i + 2][0], vertices[i + 2][1], vertices[i + 2][2]);
	    vertex_color(model, c_gray, 1);
	}
	
	vertex_end(model);
	return model;
}