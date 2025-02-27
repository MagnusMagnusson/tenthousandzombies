ds_list_add(fps_list, fps_real);
if(ds_list_size(fps_list) > 60){
	ds_list_delete(fps_list, 0);
}
var sum = 0;
for(var i = 0; i < ds_list_size(fps_list); i++){
	sum += fps_list[|i];
}
fps_average = floor(sum /  ds_list_size(fps_list));