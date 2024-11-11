///create timer
function timer_create(_timemax){
	return [0, _timemax];
}
///dar un tiempo al timer
function timer_set(_timer, _num=100000){
	_timer[0] = clamp(_num, 0, _timer[1]);
}
///va en el evento step
function timer_action(_timer){
	_timer[0] = clamp(_timer[0]-1, 0, _timer[1]);
}
//ver si esta corriendo el timer
function timer_run(_timer){
	return _timer[0] != 0;
}


function val_oneshot(_valoneshot, val_index, _condicion, _function){
	if (_valoneshot != val_index and _condicion){
		_valoneshot = val_index;
		if (_condicion){
			script_execute(_function);
		}
	}
	return _valoneshot;
}
	

function val_oneshot_v1(_valoneshot, _condicion, _function){
	if (_condicion){
		if (_valoneshot = false){
			script_execute(_function);
			_valoneshot = true;
		}
		if (_valoneshot = true){
			_valoneshot = -true;
		}
	}else{
		_valoneshot = false
	}
	return _valoneshot;
}


	
function Snd_playSet(_emitter, _snd){
	var dist = point_distance(x, y, player.x, player.y);
	var dist_min = 160;   // Distancia donde empieza a bajar
	var dist_max = 500;  // Distancia donde ya no se oye
	var volumen;
	
	if (dist <= dist_min)		volumen = 1;
	else if (dist >= dist_max)  volumen = 0;
	else						volumen = 1 - ((dist - dist_min) / (dist_max - dist_min));
	
	if (dist <= dist_max){
		audio_emitter_gain(_emitter, volumen);
		audio_emitter_position(_emitter, x, y, y);
		audio_play_sound_on(_emitter, _snd,0,0,,,random_range(0.8,1.2));
	}
}