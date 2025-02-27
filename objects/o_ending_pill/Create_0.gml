model = ModelManager().get("powerup/pillbox");
rot = 0;
zspeed = 0.75;
dir = -1;
z = 20;

f = method(id, function(){
	instance_destroy();
	instance_create_layer(x,y, layer, o_bed_dream);
	o_world.stats.current.level++;
	o_world.stats.lifetime.level++;
	o_player.life = o_player.max_life;
});