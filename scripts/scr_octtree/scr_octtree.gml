function Octree(__x, __y, __z, _size, _maxObjects, _maxDepth) constructor {
    _x = __x;
	_y = __y;
	_z = __z;
	size = _size;
	maxObjects = _maxObjects;
	maxDepth = _maxDepth;
	objects = [];
	children = [];
	
	static insert = function(object){
		if (array_length(children) > 0) {
	        for (var i = 0; i < 8; i++) {
	            if (children[i].object_in_node(object)) {
	                children[i].insert(object);
	            }
	        }
			return;
	    }

		array_push(objects, object);

	    // If we exceed the max objects and are not at max depth, split
	    if (array_length(objects) > maxObjects && maxDepth > 0) {
	        split();
	        // Re-insert objects into the correct children
	        for (var i = 0; i < array_length(objects); i++) {
	            var obj = objects[i];
	            for (var j = 0; j < 8; j++) {
	                if (children[j].object_in_node(obj)) {
	                    children[j].insert(obj);
	                }
	            }
	        }
	        objects = [];
	    }
	}
	
	static get_child_index = function(object) {
	    var index = 0;
	    if (_x > _x) index += 1;
	    if (_y > _y) index += 2;
	    if (_z > _z) index += 4;
	    return index;
	}
	
	static split = function(){
		var halfSize = size / 2;
	    for (var i = 0; i < 8; i++) {
	        var _x = _x + (i & 1 ? halfSize : -halfSize);
	        var _y = _y + (i & 2 ? halfSize : -halfSize);
	        var _z = _z + (i & 4 ? halfSize : -halfSize);
	        array_push(children, new Octree(_x, _y, _z, halfSize, maxObjects, maxDepth - 1));
	    }

	    // Re-insert objects into the correct children
	    for (var i = 0; i < array_length(objects); i++) {
	        var object = objects[i];
	        var index = get_child_index(object);
	        children[index].insert(object);
	    }
	    objects = [];
	}
	
	static collide = function(object, collisions){
	    // Check for collisions with objects in this node
	    for (var i = 0; i < array_length(objects); i++) {
	        var _other = objects[i];
	        if (object != _other && check_collision(object, _other)) {
	            array_push(collisions, _other);
	        }
	    }

	    // If we have children, check the relevant child nodes
	    if (array_length(children) > 0) {
	        for (var i = 0; i < 8; i++) {
	            if (children[i].object_in_node(object)) {
	                collide(object, collisions);
	            }
	        }
	    }
	}
	
	static object_in_node = function(object){
		var w = object.image_xscale * sprite_get_width(object.sprite_index);
		var h = object.image_yscale * sprite_get_height(object.sprite_index);
		var d = object.height;
		return (object.x - w / 2 < _x + size / 2) &&
           (object.x + w / 2 > _x - size / 2) &&
           (object.y - h / 2 < _y + size / 2) &&
           (object.y + h / 2 > _y - size / 2) &&
           (object.z - d / 2 < _z + size / 2) &&
           (object.z + d / 2 > _z - size / 2);
	}
}


function check_collision(object1, object2) {
    // Simple bounding box collision detection
	if(instance_exists(object1) && instance_exists(object2)){
	    return (abs(object1.x - object2.x) < (object1.image_xscale * sprite_get_width(object1.sprite_index) + (object2.image_xscale * sprite_get_width(object2.sprite_index)) / 2) &&
	           (abs(object1.y - object2.y) < (object1.image_yscale * sprite_get_height(object1.sprite_index) + object2.image_yscale * sprite_get_height(object2.sprite_index)) / 2) &&
	           (abs(object1.z - object2.z) < (object1.height + object2.height) / 2));
	} else {
		return false;
	}
}