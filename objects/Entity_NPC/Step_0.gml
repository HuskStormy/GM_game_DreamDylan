/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

if (behavior_move == "none")
	Grpth_objetive = self;
if (behavior_move == "follow_player")
	Grpth_objetive = player;
if (behavior_move == "path"){
	
	var _point_final	= {x: Grpth_point_fnl.x, y: Grpth_point_fnl.y}
	var _Grpth_cond_Radio		= (point_distance(x,y,_point_final.x, _point_final.y) < Grpth_point_radio);


	if (_Grpth_cond_Radio){
		Grpth_objetive = ScrPath[Grpth_path_index];
		
		Grpth_path_index++
		if (Grpth_path_index > array_length(ScrPath) - 1)	
			Grpth_path_index = 0;
		
	}
	
	
}

if (behavior_move == "follow"){

	_point_direc = point_direction(x,y,player.x,player.y);
	_point_dista = point_distance (x,y,player.x,player.y);
	Grpth_view_free= !collision_line(x,y,player.x,player.y, Parent_Solid,false,false);
	switch (my_view) {
		case view.down:		{_d = _point_direc<315 and _point_direc>225;} break;
		case view.up:		{_d = _point_direc<135 and _point_direc>45;} break;
		case view.left:		{_d = _point_direc<225 and _point_direc>135;} break;
		case view.right:	{_d = (_point_direc<45  and _point_direc>0) || (_point_direc<359  and _point_direc>315)} break;
	}
	
	
	
	if ((Grpth_view_free and _point_dista<Grpth_view_max and _d) || (_point_dista<Grpth_view_min and Grpth_view_free))
		Grpth_view_obj_b = true;
	if (_point_dista > Grpth_view_max)
		Grpth_view_obj_b = false;
		
		
	if (Grpth_view_obj_b){
		Grpth_view_obj = [player.x, player.y]
		timer_set(timer_grpth_view);
	}
	if (Grpth_view_obj_b = false){
		timer_action(timer_grpth_view);
		if (!timer_run(timer_grpth_view)){
			Grpth_view_obj = [xstart, ystart]
		}
	}
	
	
	Grpth_objetive = Grpth_view_obj
	
	
	
	
	
	
	
	
	
	
	
	
	
}