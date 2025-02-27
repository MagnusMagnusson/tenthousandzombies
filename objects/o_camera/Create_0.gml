if(instance_number(o_camera) > 1){
	active = o_camera == id;
} else {
	active = true;
}

z = 0;
fov = 70;
width = 1366;
height = 768;
wport = 1366;
hport = 768;
lookat = new Vector(0,0,0);
zplane = 3600000;
up = new Vector(0,0,-1);