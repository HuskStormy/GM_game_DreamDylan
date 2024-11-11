// Inherit the parent event
event_inherited();

move_relative = !(coll_puerta);
if (sign(coll_puerta)){
	timer_action(timer_open_door);
	if (!timer_run(timer_open_door)){
		coll_puerta.close = false;
	}
}else{
	timer_set(timer_open_door)
}



point_accion();
my_path = path_add();
if (mp_grid_path(control.grid_mapa, my_path, x, y, point_final_x, point_final_y, true) and move_knocked and !timer_run(timer_wait))
	path_start(my_path, move_speed * move_relative, path_action_stop, false);



#region comportamiento
	///SEGUIR
	if (comportamiento = "default"){
		if (point_distance(x,y,point_final_x, point_final_y) < 8){
			if (!lista_random){
				if (array_length(lista)-1 <= point_next) point_next = 0;
				else point_next++;
			}else{
				point_next = irandom_range(0,array_length(lista)-1);
			}
			timer_set(timer_wait, timer_wait[1]);
		}

		point_final_x = lista[point_next][0];
		point_final_y = lista[point_next][1];

		timer_action(timer_wait);
	}
	///SEGUIR
	if (comportamiento = "follow"){
		point_final_x = obj_player.x;
		point_final_y = obj_player.y;
	}
	///QUIETO
	if (comportamiento = "wait"){
		point_final_x = x;
		point_final_y = y;
	}
#endregion






direc = directional(x,y,point_x, point_y);