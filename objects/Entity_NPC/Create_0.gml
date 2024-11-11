event_inherited();

if (behavior_move == "none")
	Grpth_objetive = self;
if (behavior_move == "follow_player")
	Grpth_objetive = player;
if (behavior_move == "path"){
	Grpth_path_index = 0;
	
	var _point_final	= {x: Grpth_point_fnl.x, y: Grpth_point_fnl.y}
	var _Grpth_cond_Radio		= (point_distance(x,y,_point_final.x, _point_final.y) < Grpth_point_radio);


	if (_Grpth_cond_Radio){
		Grpth_objetive = ScrPath[Grpth_path_index];
		
		Grpth_path_index++
		if (Grpth_path_index >= array_length(ScrPath) - 1)	
			Grpth_path_index = 0;
		
	}
	
	
}


Grpth_view_obj = [x, y]
Grpth_view_obj_b = false;
Grpth_view_max = 450;
Grpth_view_min = 160;
timer_grpth_view = timer_create(irandom_range(60*2,60*4));