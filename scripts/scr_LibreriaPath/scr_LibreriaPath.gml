//////FUNCIONES UTILES
function position_in_objectssss(_o){
	if (instance_exists(_o))
		return [_o.x,_o.y];
	else
		return [0,0];
}

function position_point(_object_or_array) {
    var _o = _object_or_array;
    if (is_array(_o)) {               // Si es un array
        return {x: _o[0], y: _o[1]};  // Convierte array a estructura
    } else {                          // Si es un objeto
        return {x: _o.x, y: _o.y};    // Convierte objeto a estructura
    }
}

function directional(_x_sta,_y_sta,_x_fnal,_y_fnal){
	var _dir = point_direction(_x_fnal,_y_fnal,_x_sta,_y_sta)
	var _r = 20;
	if (_dir >=0 and _dir < 45+_r)				return 0
	else if (_dir >=45+_r  and _dir < 135-_r)	return 90
	else if (_dir >=135-_r and _dir < 225+_r)	return 180
	else if (_dir >=225+_r and _dir < 315-_r)	return 270
	else if (_dir >=315-_r and _dir < 360)		return 0
}



//////LIBRERIA DE SCRPATH
function ScrPath_prueba(){
	return [
		inst_point_A,
		inst_point_D,
		inst_point_C,
		player
	]
}