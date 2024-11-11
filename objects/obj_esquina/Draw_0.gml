//_cam = obj_player;

//var _x1 = (sign(image_xscale) = 1) ? bbox_left : bbox_right;
//var _y1 = bbox_top;
//var _y2 = bbox_bottom;
	
//var cond = (sign(image_xscale) = 1) ? (_cam.x <= _x1) : _cam.x >= _x1
//if not (cond and _cam.y >= _y2){
//	var _dir = 180	+ point_direction(_x1,_y2,_cam.x,_cam.y);
//	var _zx1 = _x1	+ lengthdir_x(Sombra_Len,_dir);
//	var _zy1 = _y2	+ lengthdir_y(Sombra_Len,_dir);
	
//	if (sign(image_xscale) = 1){
//	_dir_Alt = (_cam.x <= _x1) ? 0 : point_direction(_x1,_y1,_cam.x,_cam.y)
//	var _dir = (!(_cam.x <= _x1)*180)	+ _dir_Alt;
//	}
//	if (sign(image_xscale) = -1){
//	_dir_Alt = (_cam.x >= _x1) ? 0 : point_direction(_x1,_y1,_cam.x,_cam.y)
//	var _dir = (180)	+ _dir_Alt;
//	}
	
	
//	var _zx2 = _x1	+ lengthdir_x(Sombra_Len,_dir);
//	var _zy2 = _y1	+ lengthdir_y(Sombra_Len,_dir);
	
//	draw_set_color(c_black)
//	draw_triangle(_x1,_y2,	_x1,_y1,	_zx1,_zy1,	false);
//	draw_triangle(_x1,_y1,	_zx1,_zy1,	_zx2,_zy2,	false);
//	draw_set_color(c_white)
//}