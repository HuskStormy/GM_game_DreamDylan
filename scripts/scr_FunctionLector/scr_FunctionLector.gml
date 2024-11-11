function lector_cvs(_colum, _fila){
	return global.book_read[# _colum, _fila-1];
}
function dialogo_index(_inx){
	return global.book_read[# global.idioma, real(_inx)-1];
}
function dialogo_funct(_inx){
	return string_split(global.book_read[# 1, _inx-1], ":");
}

function dialogo_chara(_inx){
	return string_split(global.book_read[# 2, _inx-1], ":");
}

function dialogo(_inx){
	return real(global.book_read[# 9, _inx-1]);
}




function instance_dialogo(_id_dialogo){
	instance_create_layer(0,0,LYR_CONTROL,cntrl_dialogo,{dlg_ini: dialogo(_id_dialogo)})
}