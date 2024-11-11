

#macro Sombra_Len 2000

function Sombra_rectagular(_x1 = bbox_left, _y1 = bbox_top, _x2 = bbox_right, _y2 = bbox_bottom){
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	
	//var _x1v =_x1 - _x;
	//var _y1v =_y1 - _y;
	//var _x2v =_x2 - _x;
	//var _y2v =_y2 - _y;
	
	var _dir = 180	+ point_direction(_x1,_y1,_cam.x,_cam.y);
	var _zx1 = _x1	+ lengthdir_x(Sombra_Len,_dir);
	var _zy1 = _y1	+ lengthdir_y(Sombra_Len,_dir);

	var _dir = 180	+ point_direction(_x2,_y2,_cam.x,_cam.y);
	var _zx2 = _x2	+ lengthdir_x(Sombra_Len,_dir);
	var _zy2 = _y2	+ lengthdir_y(Sombra_Len,_dir);

	var _dir = 180	+ point_direction(_x2,_y1,_cam.x,_cam.y);
	var _zx3 = _x2	+ lengthdir_x(Sombra_Len,_dir);
	var _zy3 = _y1	+ lengthdir_y(Sombra_Len,_dir);

	var _dir = 180	+ point_direction(_x1,_y2,_cam.x,_cam.y);
	var _zx4 = _x1	+ lengthdir_x(Sombra_Len,_dir);
	var _zy4 = _y2	+ lengthdir_y(Sombra_Len,_dir);


	
		draw_rectangle(_x1-_x,_y1-_y,_x2-_x,_y2-_y,false)
		draw_triangle(_x1-_x,	_y1-_y,		_x2-_x,	_y2-_y,		_zx1-_x,_zy1-_y,	false);
		draw_triangle(_zx1-_x,	_zy1-_y,	_zx2-_x,_zy2-_y,	_x2-_x,	_y2-_y,		false);

		draw_triangle(_x1-_x,	_y2-_y,		_x2-_x,	_y1-_y,		_zx3-_x,_zy3-_y,	false);
		draw_triangle(_x1-_x,	_y2-_y,		_zx4-_x,_zy4-_y,	_zx3-_x,_zy3-_y,	false);
	
}
	
	
function draw_list(_List){
	var _n = ds_list_size(_List);
	for (var i = 0; i < _n; ++i) {
		var item = ds_list_find_value(_List, i)
	    draw_text(0,12+(12*i),item);
	}
}


function draw_dataArray(Array, _x, _y, _r=12){
	for (var i = 0; i < array_length(Array); ++i) {
		draw_text(_x,_y+(_r*i), Array[i]);
	}
}

function draw_entity_inShadown(_dsprite, _dimage_index, _dx, _dy){
//draw_circle(x,y,4,1);
//draw_circle(point_previous.x,point_previous.y,4,1);

//draw_text(x,y+64, oneshot_sndStep)

var b_l = camera_get_view_x(view_camera[0]);
var b_t = camera_get_view_y(view_camera[0]);
var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

var limit_cam_in = (bbox_bottom > b_d) || (bbox_top < b_t) || (bbox_left < b_l) || (bbox_right > b_r);
//draw_text(x,y-64,timer_open_door[0] )
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _getw = (x - _x);
var _geth = (y - _y);

var _get = color_get_value(surface_getpixel(global.Surf_Sombra,_getw, _geth))

var _obj = player;



shader_set(shd_sombra_Entity)

	var _shd_dist	= shader_get_uniform(shd_sombra_Entity, "_dist");
	var _shd_Shadow	= shader_get_uniform(shd_sombra_Entity, "_shadow");
	var _shd_Limt	= shader_get_uniform(shd_sombra_Entity, "_Limt");
	shader_set_uniform_f(_shd_dist,		median(0,360,point_distance(_obj.x, _obj.y,x,y))/360 );
	shader_set_uniform_f(_shd_Shadow,	_get/255);
	shader_set_uniform_f(_shd_Limt,	limit_cam_in);
	draw_sprite(_dsprite, _dimage_index, _dx, _dy)
shader_reset();
}