// Inherit the parent event
event_inherited();


var keyRight	= keyboard_check(vk_right)	* move_knocked;
var keyLeft		= keyboard_check(vk_left)	* move_knocked;

var keyDown		= keyboard_check(vk_down)	* move_knocked;
var keyUp		= keyboard_check(vk_up)		* move_knocked;

key_accion = keyboard_check_pressed(ord("X")) 	* move_knocked;
key_Inv = keyboard_check_pressed(ord("A"));

move_x = (keyRight	- keyLeft)	*	move_speed;
move_y = (keyDown	- keyUp)	*	move_speed;


if (sign(move_x) = 0){
	if (sign(move_y)= 1)			my_view = view.down;
	else if (sign(move_y) = -1)		my_view = view.up;
}else{
	if (sign(move_x) = 1)			my_view = view.right;
	else if (sign(move_x) = -1)		my_view = view.left;
}

if (move_x!=0 or move_y!=0) my_accion = accion.caminando;
else my_accion = accion.parado;
if (place_meeting(x+sign(move_x * !abs(move_y)), y, solidos)) my_accion = accion.parado;
if (place_meeting(x, y+sign(move_y * !abs(move_x)), solidos)) my_accion = accion.parado;
sprite = list_sprite[my_accion][my_view];


move_and_collide(move_x, move_y, solidos);




if (coll_puerta){
	if (key_accion){
		coll_puerta.close = !coll_puerta.close;
		if (coll_puerta.close) audio_play_sound(snd_door_close,0,0);
		else audio_play_sound(snd_door_open,0,0);
	}
		timer_set(coll_puerta.timer_funct_delay_row,30);
		
}

with(obj_puerta){
	if (coll_A){
		if (coll_A.id = other.id and other.key_accion and close = false and !timer_run(timer_funct_delay_row)){
			close = true;
			audio_play_sound(snd_door_close,0,0);
			if (coll_intro){
				if (coll_intro.id = other.id){
				other.x = _x1;
				other.y = _y1;
				}
			}
		}
	}
	if (coll_B){
		if (coll_B.id = other.id and other.key_accion and close = false and !timer_run(timer_funct_delay_row)){
			close = true;
			audio_play_sound(snd_door_close,0,0);
			if (coll_intro){
				if (coll_intro.id = other.id){
				other.x = _x2;
				other.y = _y2;
				}
			}
		}
	}
}
	
	
	
	
if (key_Inv){
	inventario = !inventario
}
