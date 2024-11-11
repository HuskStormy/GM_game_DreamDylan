//draw_set_alpha(0.3)
//mp_grid_draw(control.grid_mapa)
//draw_set_alpha(1)
// Inherit the parent event
//event_inherited();

/////DIBUJAR EN CAMINO
//draw_path(my_path,0,0,1);

/////POINT anterior
//draw_circle(point_x, point_y,8,1)

/////FLECHA
//var _pnt = directional(x,y,point_x, point_y)
//var _x = x + lengthdir_x(32, _pnt);
//var _y = y + lengthdir_y(32, _pnt);
//draw_line_width(x,y,_x,_y,3);

////DIRECIONALES
//for (var i = 0; i < 4; ++i) {
//    var _x = x + lengthdir_x(64, 45+(90*i));
//	var _y = y + lengthdir_y(64, 45+(90*i));
//	draw_line_width(x,y,_x,_y,1);
//}


var b_l = camera_get_view_x(view_camera[0]);
var b_t = camera_get_view_y(view_camera[0]);
var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

limit_cam_in = (bbox_bottom > b_d) || (bbox_top < b_t) || (bbox_left < b_l) || (bbox_right > b_r);
//draw_text(x,y-64,timer_open_door[0] )
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _getw = (x - _x);
var _geth = (y - _y);

var _get = color_get_value(surface_getpixel(global.Surf_Sombra,_getw, _geth))

var _obj = obj_player;



shader_set(shd_sombra_Entity)

	var _shd_dist	= shader_get_uniform(shd_sombra_Entity, "_dist");
	var _shd_Shadow	= shader_get_uniform(shd_sombra_Entity, "_shadow");
	var _shd_Limt	= shader_get_uniform(shd_sombra_Entity, "_Limt");
	shader_set_uniform_f(_shd_dist,		median(0,360,point_distance(_obj.x, _obj.y,x,y))/360 );
	shader_set_uniform_f(_shd_Shadow,	_get/255);
	shader_set_uniform_f(_shd_Limt,	limit_cam_in);
	draw_sprite(sprite, image_index,x,y)
shader_reset();