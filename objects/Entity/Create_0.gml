#region Movimiento, Solidos
	//Movemiento
	Move		= {x:0, y:0};	//move
	Move_speed	= 2;	//move
	Move_Const	= {x:0, y:0};	//consMove

	point_previous = {x: x, y: y};
	view_direccional = 0;
	
	List_Solid = [layer_tilemap_get_id("Tiles_1"), obj_block, obj_block_secon, obj_puerta, obj_esquina];
#endregion

#region Gripth Path
	Grpth_path			= path_add();
	Grpth_objetive		= player;
	Grpth_point_Cine	= position_point(self);
	Grpth_point_fnl		= position_point(Grpth_objetive);
	Grpth_point_radio	= 64;
	Grpth_Solid			= Parent_Solid;
	mp_grid_add_instances(global.grid_mapa, Grpth_Solid, false);
#endregion

#region Estados y Acciones

	enum Estado	{Bien=0,	Herido=1}
	enum Accion	{parado=0,	caminando=1}
	enum View	{right=0,	up=1,	left=2,	down=3}
	my_view	= View.down;
	my_accion	= Accion.parado;
	my_estado	= Estado.Bien;
	my_sprite	= sprite_index;
	list_sprite = 
	[
		//parado
		[spr_entity_stop_right, spr_entity_stop_up, spr_entity_stop_left, spr_entity_stop_down],
		//caminando
		[spr_entity_walk_right, spr_entity_walk_up, spr_entity_walk_left, spr_entity_walk_down]
	]
	image_index = random(sprite_get_number(sprite_index));
	image_speed = 1.3
#endregion

#region Sonidos
	emitter = audio_emitter_create();
	audio_emitter_falloff(emitter, 20, 50, 2);


	mysnd_step		= snd_step;
	mysnd_damage	= pointer_null;
#endregion

#region vals -> ONESHOT
	oneshot_sndStep = false;
	
#endregion
#region comportamiento
	actor = "none";
	inst_cntrl	= false;
	Cinematico	= instance_exists(cntrl_dialogo);
#endregion





#region Timers
	timer_accion = timer_create(30);

#endregion