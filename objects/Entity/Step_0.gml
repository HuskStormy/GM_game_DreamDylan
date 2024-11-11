depth = -bbox_bottom;	///aplicar lo de profundidad
inst_cntrl	= instance_exists(cntrl_inventario);
Cinematico	= instance_exists(cntrl_dialogo);
paralyzed	= sign(inst_cntrl + Cinematico);





#region Movimiento, Accion Etc..

	var _r_dist = 4
	///Formacion para el el XY Anterior
	if (point_distance(x,y,point_previous.x, point_previous.y) > _r_dist){
		if (point_previous.x != x) point_previous.x += (x - point_previous.x) * .3;
		if (point_previous.y != y) point_previous.y += (y - point_previous.y) * .3;
	}
	if (point_distance(x,y,point_previous.x, point_previous.y) <= (_r_dist))
		my_accion = accion.parado
	else
		my_accion = accion.caminando
	/// convertir el posision de punto anterior con punto actual a numerio del plano carteciano
	view_direccional	= directional(x,y,point_previous.x, point_previous.y);

	
	// establese que segundo donde mirando "view_direccional ==>> my_view" 
	switch (view_direccional) {
	    case 0:		my_view = view.right;	break;
		case 180:	my_view = view.left;	break;
		case 90:	my_view = view.up;		break;
		case 270:	my_view = view.down;	break;
	    default:	my_view = view.right;	break;
	}

	///Definir los movimiento fijos segun donde mire
	switch (my_view) {
		case view.down:		{Move_Const.x = 0;  Move_Const.y = 1; } break;
		case view.up:		{Move_Const.x = 0;  Move_Const.y = -1;} break;
		case view.left:		{Move_Const.x = -1; Move_Const.y = 0; } break;
		case view.right:	{Move_Const.x = 1;  Move_Const.y = 0; } break;
		default:			{Move_Const.x = 1;  Move_Const.y = 0; } break;
	}


#endregion

#region Gripth Path
	if (actor != "player"){
		Grpth_point_fnl		= position_point(Grpth_objetive);
		var _point_final	= (Cinematico == true) ? {x: Grpth_point_Cine.x, y: Grpth_point_Cine.y} : {x: Grpth_point_fnl.x, y: Grpth_point_fnl.y}
		
		var _Grpth_cond_RutaViable	= mp_grid_path(global.grid_mapa, Grpth_path, x, y,_point_final.x, _point_final.y, true);
		var _Grpth_cond_Radio		= point_distance(x,y,_point_final.x, _point_final.y) > Grpth_point_radio;

		if (_Grpth_cond_RutaViable and _Grpth_cond_Radio)
			path_start(Grpth_path, Move_speed * !inst_cntrl, path_action_stop, false);
	}
#endregion

#region Sonidos

	///Dar sonido Steps
	if (my_accion = accion.caminando){
		var _condicion	= (round(image_index)=1) || (round(image_index)=3);
		oneshot_sndStep = val_oneshot_v1(oneshot_sndStep, _condicion, function(){Snd_playSet(emitter, snd_step)});
	}
	

#endregion

my_sprite	= list_sprite[my_accion][my_view];


if (inst_cntrl) timer_set(timer_accion);
else timer_action(timer_accion)
