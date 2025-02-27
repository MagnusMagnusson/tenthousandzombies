draw_self()

var w = display_get_gui_width();
var h = display_get_gui_height();
var pos = new Vector(o_camera.x, o_camera.y, o_camera.z);
var lookat = o_camera.lookat.Add(pos.Invert());
	
//lookat = new Vector(0,0, o_camera.lookat._z);
var dot = lookat.Dot(new Vector(0,0,1));
var cosTheta = dot / lookat.magnitude();
var theta = 90 - darccos(cosTheta);
var doffset = 33;
if(theta < -20){
	doffset -= 2*(20 + theta)
} 