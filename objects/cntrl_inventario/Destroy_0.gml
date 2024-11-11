var _inv_n = ds_list_size(global.invetario);

for (var i = 0; i < _inv_n; ++i) {
	var _found = ds_list_find_value(global.invetario, i);	
	
	
	show_debug_message(_found)
	show_debug_message(_found[2] == 0)
    if (_found[2] == 0){
		ds_list_delete(global.invetario, i);
		
		break;
	}
}
