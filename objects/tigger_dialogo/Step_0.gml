timer_action(timer_wait);
if (instance_exists(cntrl_dialogo)) timer_set(timer_wait,60)



coll_player = instance_place(x,y,obj_player);


if (coll_player and !instance_exists(cntrl_dialogo) and !timer_run(timer_wait)) {
	if (!oneShot){
		if (coll_player.key_accion)
			instance_dialogo(id_dialogo);
	}else{
		instance_dialogo(id_dialogo);
		instance_destroy();
	}
}