function Vector(xx,yy,zz) constructor{
	_x = xx;
	_y = yy;
	_z = zz;
	
	static magnitude = function(){
		return sqrt(_x * _x + _y * _y + _z * _z);
	}
	
	static normal = function(factor = 1){
		var m = self.magnitude();
		var xx = _x / m;
		var yy = _y / m;
		var zz = _z / m;
		return new Vector(factor * xx, factor * yy,factor * zz);
	}
	
	static Add = function(vectors_to_add){
		var xx,yy,zz;
		xx = _x;
		yy = _y;
		zz = _z;
		if(is_array(vectors_to_add)){
			for(var i = 0; i < array_length(vectors_to_add); i++){
				var v = vectors_to_add[i];
				xx += v._x;
				yy += v._y;
				zz += v._z;
			}
		} else {
			xx += vectors_to_add._x;
			yy += vectors_to_add._y;
			zz += vectors_to_add._z;
		}
		return new Vector(xx,yy,zz);
	}
	
	static Scale = function(factor){
		return new Vector(_x * factor, _y * factor, _z * factor);
	}
	
	static Invert = function(){
		return new Vector(-_x, -_y, -_z);
	}
	
	static Cross = function(vector2){
		var xx = _y * vector2._z - _z * vector2._y;
		var yy = _x * vector2._x - _x * vector2._z;
		var zz = _x * vector2._y - _y * vector2._x;
		
		return new Vector(xx,yy,zz);
	}
	
	static Dot = function(vector2){
		return _x * vector2._x + _y * vector2._y + _z * vector2._z
	}
	
	static RotateAround = function(V, degrees){
		var radians = degtorad(degrees);
		var cosT = cos(radians);
		var sinT = sin(radians);
	    var RotationMatrix = [
			[cosT + V._x*V._x * (1 - cosT), V._x * V._y * (1 - cosT) - V._z * sinT, V._x * V._z * (1 - cosT) + V._y * sinT],
	        [V._y * V._x * (1 - cosT) + V._z * sinT, cosT + V._y * V._y * (1 - cosT), V._y * V._z * (1 - cosT) - V._x * sinT],
	        [V._z * V._x * (1 - cosT) - V._y * sinT, V._z * V._y * (1 - cosT) + V._x * sinT, cosT + V._z * V._z* (1 - cosT)]
	    ]

	    // Apply the rotation matrix to vector P

	    var xx = _x * RotationMatrix[0][0] + _y * RotationMatrix[1][0] + _z * RotationMatrix[2][0]
	    var yy = _x * RotationMatrix[0][1] + _y * RotationMatrix[1][1] + _z * RotationMatrix[2][1]
	    var zz = _x * RotationMatrix[0][2] + _y * RotationMatrix[1][2] + _z * RotationMatrix[2][2]

	    return new Vector(xx,yy,zz);
	}
	static ToString = function(){
		return string("({0}, {1}, {2})", _x, _y, _z);
	}
}