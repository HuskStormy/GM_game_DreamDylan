keyleft		= keyboard_check_pressed(vk_left);
keyright	= keyboard_check_pressed(vk_right);
keyup		= keyboard_check_pressed(vk_up);
keydown		= keyboard_check_pressed(vk_down);
keyselect	= keyboard_check_pressed(ord("X"));
keyexit		= keyboard_check_pressed(ord("A"));


var _inv_n = ds_list_size(global.invetario)-1;




if (menu[menu_num] = "acc"){
	if (keyup	and (select_accion!=0)){
		select_accion--;
		audio_play_sound(snd_gui_clickB,0,0);
	}
	if (keydown	and (select_accion!=array_length(list_accion)-1)){
		select_accion++;
		audio_play_sound(snd_gui_clickB,0,0);
	}
	if (keyselect and ref_obj != pointer_null){
		
		var _found = ds_list_find_value(global.invetario, select);
		var _item  = scr_Item_get(_found[0]);
		if (ref_obj.Item_requerido = _item[ITEM_ID]){
			audio_play_sound(snd_gui_select,0,0,,,1.5);
			ref_obj.inv_completo = true;
			ds_list_set(global.invetario, select, [_found[0], _found[1], _found[2]-1])
			instance_destroy();
		}else{
			audio_play_sound(snd_gui_select,0,0,,,0.3);
		}
	}else if (keyselect and ref_obj == pointer_null){
			audio_play_sound(snd_gui_select,0,0,,,0.3);
	}
}


















if (menu[menu_num] = "inv"){
	if (keyleft  and (select!=0)){
		select--;
		select_accion = 0;
		audio_play_sound(snd_gui_clickA,0,0);
	}
	if (keyright and (select!=_inv_n)){
		select++;
		select_accion = 0;
		audio_play_sound(snd_gui_clickA,0,0);
	}
	if (keyselect){
		audio_play_sound(snd_gui_select,0,0);
		menu_num = 1;
	}
}




if (keyexit){
	if (menu_num = 0)
		instance_destroy();
	else
		menu_num--;
	
	audio_play_sound(snd_gui_select,0,0,,,0.5);
}