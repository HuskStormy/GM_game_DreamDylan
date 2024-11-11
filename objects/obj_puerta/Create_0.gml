close = true;
oneshot_close = close;


coll = false;
coll_A = false;
coll_B = false;
coll_intro = false;




inv_requerido = pointer_null;
inv_completo	= false;


timer_funct_delay_row = timer_create(30);

#region Sonidos
	emitter = audio_emitter_create();
	audio_emitter_falloff(emitter, 10, 50, 3);
#endregion