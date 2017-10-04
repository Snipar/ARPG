//Resize depth grid

var inst_num = instance_number(par_depthObject);
var dgrid = ds_depthgrid

ds_grid_resize(dgrid, 2, inst_num)

//ADD INSTANCES TO THE GRID
var yy = 0
with(par_depthObject){
	dgrid[# 0, yy] = id
	dgrid[# 1, yy] = y
	yy += 1
}

//SORT THE GRID IN ASCENDING ORDER
ds_grid_sort(dgrid, 1, true)

//LOOP THROUGH THE GRID AND ALL INSTANCES
var yy = 0
var inst
repeat(inst_num){

	//PULL OUT AN ID
	inst = dgrid[# 0, yy]
	//DRAW YOURSELF
	with(inst){
		event_perform(ev_draw, 0)
	}
	
	yy += 1
}