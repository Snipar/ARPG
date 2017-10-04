moveX = 0;
moveY = 0;

//Update Input

input_left =   keyboard_check(vk_left);
input_right =  keyboard_check(vk_right);
input_up =     keyboard_check(vk_up);
input_down =   keyboard_check(vk_down);
input_walk =   keyboard_check(vk_control);
input_run =    keyboard_check(vk_shift);

//Alter Speed

if(input_walk or input_run){
	spd = abs((input_walk*w_spd) - (input_run*r_spd));
}else{
	spd = n_spd;
}


//Intended Movement
moveY = (input_down - input_up) * spd;
if(moveY == 0){
	moveX = (input_right - input_left) * spd;
}

//GET DIRECTION PLAYER IS FACING
if(moveX != 0){
	switch(sign(moveX)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if(moveY != 0){
	switch(sign(moveY)){
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
} else {
	facing = -1
}

//Collision check
//Horizonatal
if(moveX != 0){
	var collisionH = instance_place(x+moveX, y, obj_collision)
	if(collisionH != noone and collisionH.collideable){
		repeat(abs(moveX)){
			if(!place_meeting(x+sign(moveX), y, obj_collision)){
				x += sign(moveX);
			}else{
				break;
		}
	}
	moveX = 0;
}
}

//Verticle
if(moveY != 0){
	var collisionV = instance-plane(x, y+moveY, obj_collision)
	if(collisionV != noone and collisionV.collideable){
		repeat(abs(moveX)){
			if(!place_meeting(x, y+sign(moveY), obj_collision)){
				y += sign(moveY);
			}else{
				break;
		}
	}
	moveY = 0;
}
}

//OBJECTS
var inst = instance_place(x,y,obj_transsition)
if(inst != noone and facing == inst.playerFacingBefore){
	with(game){
		if(!doTransition){
			spawnRoom = inst.targetRoom
			spawnX = inst.targetX
			spawnY = inst.targetY
			spawnPlayerFacing = inst.playerFacingAfter
			doTransition = true
		}
	}
}

//Apply Movement

x += moveX;
y += moveY;
