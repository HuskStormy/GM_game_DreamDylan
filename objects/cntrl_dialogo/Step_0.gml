timer_action(timer_delay_row);
timer_action(funct_delay_timer);



var keyNextDialogue = keyboard_check_pressed(ord("X")) * !timer_run(timer_delay_row);

///FUNCION "START"
if (lct_func[FUNC_INXD] = DLG_START){
	var _val = event_ARG_BOOL(FUNC_ARG_A);
	
	event_NextRow();
	dlg_show = _val;
}
///FUNCION "FINAL"
if (lct_func[FUNC_INXD] = DLG_FINAL){
	instance_destroy();
}
///FUNCION "TEXT"
if ((lct_func[FUNC_INXD] = DLG_TEXT || lct_func[FUNC_INXD] = "") and keyNextDialogue){
	event_NextRow();
	timer_set(timer_delay_row);
}
///FUNCION "DLG_DIALGHOW"
if (lct_func[FUNC_INXD] = DLG_DIALGHOW){
	var _val = event_ARG_BOOL(FUNC_ARG_A);
	
	event_NextRow();
	dlg_show = _val;
}
///FUNCION "DELAY"
if (lct_func[FUNC_INXD] = DLG_DELAY || lct_func[FUNC_INXD] = DLG_TXTDLY){
	text		= dialogo_index(row_inx);
	_memr	= dlg_show;
	if (funct_delay = false){
		if (lct_func[FUNC_INXD] = DLG_TXTDLY) dlg_show = true;
		funct_delay = true;
		timer_set(funct_delay_timer, max(0, lct_func[FUNC_ARG_A]));
	}
	if (funct_delay_timer[0] = 1 and funct_delay){
		if (lct_func[FUNC_INXD] = DLG_TXTDLY) dlg_show = _memr;
		event_NextRow();
		funct_delay = false;
	}
}
///FUNCION "ROW AND COMENT"
if (lct_func[FUNC_INXD] = DLG_ROW || lct_func[FUNC_INXD] = DLG_COMENT){
	event_GottoRow(lct_func[FUNC_ARG_A])
	timer_set(timer_delay_row);
}
///FUNCION "Prgunta"
if (lct_func[FUNC_INXD] = DLG_PREGNT){
	if keyboard_check_pressed(vk_left)  then opcion = 0;
	if keyboard_check_pressed(vk_right) then opcion = 1;
	
	text_opcion[0] = dialogo_index(lct_func[FUNC_ARG_A]);
		func[0] = real(dialogo_funct(lct_func[FUNC_ARG_A])[FUNC_ARG_A]);
		
	text_opcion[1] = dialogo_index(lct_func[FUNC_ARG_B]);
		func[1] = real(dialogo_funct(lct_func[FUNC_ARG_B])[FUNC_ARG_A]);
	if (keyNextDialogue and timer_delay_row[0]=0){
		event_GottoRow(func[opcion]);
		timer_set(timer_delay_row);
	}
}

///FUNCION "FUNCION"
if (lct_func[FUNC_INXD] = DLG_FUNCT){
	var _exe = asset_get_index(lct_func[FUNC_ARG_A])
	
	if (script_exists(_exe))
		script_execute(_exe)
		
	else {
		show_message("no existe la funcion:" + lct_func[FUNC_ARG_A])
		game_end();
	}
	event_NextRow()
}


///FUNCION "CORTINA"
if (lct_func[FUNC_INXD] = DLG_CAMCORT){
	global.cam_contina = event_ARG_BOOL(FUNC_ARG_A);
	
	var _vr = 2;
	if (lct_func[FUNC_ARG_B]!="") _vr = lct_func[FUNC_ARG_B]
	global.cam_contina_val = median(0,100,_vr) / 100;
	event_NextRow()
}
	

///CHARATER
if (lct_char[FUNC_INXD] = "" || lct_char[FUNC_INXD] = DLGTYP_NORM)
	dlg_Type = DLGTYP_NORM;
else if (lct_char[FUNC_INXD] = DLGTYP_NONE)
	dlg_Type = DLGTYP_NONE;
else
	dlg_Type = DLGTYP_CHAR;