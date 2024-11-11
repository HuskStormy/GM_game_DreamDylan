var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _obj = player;

var _alt = 32;
var _w = 1-(abs(camera_get_view_width(view_camera[0]) - ((_obj.x-0)-_x) ) / camera_get_view_width(view_camera[0])) ;
var _h = 1-(abs(camera_get_view_height(view_camera[0]) - ((_obj.y-_alt)-_y) ) / camera_get_view_height(view_camera[0])) ;


//show_debug_message(_w)
shader_set(shd_sombra)
var _shd_x = shader_get_uniform(shd_sombra, "_dir_x");
var _shd_y = shader_get_uniform(shd_sombra, "_dir_y");

shader_set_uniform_f(_shd_x, _w);
shader_set_uniform_f(_shd_y, _h);

	draw_surface(global.Surf_Sombra, _x, _y);
shader_reset();