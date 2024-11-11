event_inherited();
var keyRight	= keyboard_check(vk_right)	* !paralyzed;
var keyLeft		= keyboard_check(vk_left)	* !paralyzed;
var keyDown		= keyboard_check(vk_down)	* !paralyzed;
var keyUp		= keyboard_check(vk_up)		* !paralyzed;

key_accion	= keyboard_check_pressed(ord("X"))	* !paralyzed;
key_Inv		= keyboard_check_pressed(ord("A"))	* !paralyzed;


#region desplazamiento
	
	Move.x	= (keyRight - keyLeft)	* Move_speed;
	Move.y	= (keyDown - keyUp)		* Move_speed;

	move_and_collide(Move.x, Move.y, List_Solid);
#endregion



var coll_puerta = instance_place(x+Move_Const.x,y+Move_Const.y, obj_puerta);
if (coll_puerta and key_accion){
	if (coll_puerta.close and coll_puerta.Item_requerido = pointer_null){
		coll_puerta.close = false;
	}else{
		if (!instance_exists(cntrl_inventario))
		coll_puerta.inv_requerido = instance_create_depth(0,0,0,cntrl_inventario,{ref_obj: coll_puerta});
	}
}


#region Inventario

	if (key_Inv and !instance_exists(cntrl_inventario) and !timer_run(timer_accion)){
		instance_create_depth(0,0,0,cntrl_inventario)
	}

#endregion



#region Escuchar

	audio_listener_position(x, y, 0);
	audio_listener_orientation(0, 0, 1000, 0, -1, 0);
	
#endregion