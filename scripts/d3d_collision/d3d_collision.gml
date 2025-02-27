function d3d_collision(octree, object1, object2){
	var collisions = [];
	o_world.collision_tree.collide(object1,collisions)
	for(var i = 0; i < array_length(collisions); i++){
		var o = collisions[i];
		if(o.object_index == object2 || object_is_ancestor(o.object_index,object2)){
			return true;
		}
	}
	return false;
}

function d3d_collision_list(octree, object1, object2){
	var collisions = [];
	var matching = [];
	o_world.collision_tree.collide(object1,collisions)
	for(var i = 0; i < array_length(collisions); i++){
		var o = collisions[i];
		if(o.object_index == object2 || object_is_ancestor(o.object_index,object2)){
			array_push(matching, object2);
		}
	}
	return matching;
}