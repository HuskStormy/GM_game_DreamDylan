if (!surface_exists(global.Surf_Sombra))
	global.Surf_Sombra = surface_create(CAM_WIDTH, CAM_HEIGHT);
	
	
surface_set_target(global.Surf_Sombra);
	//draw_set_color(c_black)
	//draw_rectangle(0,0,cntrl_camera.cam_w, cntrl_camera.cam_h,false)
	//draw_set_color(c_white)
	draw_clear_alpha(c_black,0)
//	draw_text(64,64,"Meow")
	//draw_roundrect(0,0,cntrl_camera.cam_w, cntrl_camera.cam_h,false)
	with (obj_block) {
		var b_l = camera_get_view_x(view_camera[0]);
		var b_t = camera_get_view_y(view_camera[0]);
		var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);



		condiciones = (bbox_bottom < b_t) and (bbox_top > b_d) and (bbox_left > b_r) and (bbox_right < b_l);



		_cam = player;
		if (!condiciones){
			surface_set_target(global.Surf_Sombra);
				Sombra_rectagular();
				//draw_rectangle(_x1-_x,_y1-_y,_x2-_x,_y2-_y,false)
				draw_text( 0, 0, "hola mundo")
			surface_reset_target()
		}
	}
	with (obj_puerta) {
		var b_l = camera_get_view_x(view_camera[0]);
		var b_t = camera_get_view_y(view_camera[0]);
		var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);



		condiciones = (bbox_bottom < b_t) and (bbox_top > b_d) and (bbox_left > b_r) and (bbox_right < b_l);



		_cam = player;
		if (!condiciones and close){
			surface_set_target(global.Surf_Sombra);
				Sombra_rectagular(,bbox_top-128);
				//draw_rectangle(_x1-_x,_y1-_y,_x2-_x,_y2-_y,false)
				draw_text( 0, 0, "hola mundo")
			surface_reset_target()
		}
	}
	with (obj_esquina) {
		var b_l = camera_get_view_x(view_camera[0]);
		var b_t = camera_get_view_y(view_camera[0]);
		var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
		condiciones = (bbox_bottom < b_t) and (bbox_top > b_d) and (bbox_left > b_r) and (bbox_right < b_l);
		
		if (!condiciones){
			var _x = camera_get_view_x(view_camera[0]);
			var _y = camera_get_view_y(view_camera[0]);
			_cam = player;

			var _x1 = bbox_left;
			var _x2 = bbox_right-1;
			var _y1 = bbox_top;
			var _y2 = bbox_bottom;

			var _dir_l = 180	+ point_direction(_x1,_y2,_cam.x,_cam.y);
			var _dir_r = 180	+ point_direction(_x2,_y2,_cam.x,_cam.y);

			var _zx2_l = _x1 + lengthdir_x(Sombra_Len, _dir_l);
			var _zy2_l = _y2 + lengthdir_y(Sombra_Len, _dir_l);

			var _zx2_r = _x2 + lengthdir_x(Sombra_Len, _dir_r);
			var _zy2_r = _y2 + lengthdir_y(Sombra_Len, _dir_r);

			if (_cam.y > _y2){
				_zx1_l = _x1;
				_zy1_l = _y1 - Sombra_Len;
				_zx1_r = _x2;
				_zy1_r = _y1 - Sombra_Len;		
			}else{
				var _dir_l = 180	+ point_direction(_x1,_y1,_cam.x,_cam.y);
				var _dir_r = 180	+ point_direction(_x2,_y1,_cam.x,_cam.y);
	
				if (_cam.x < _x1) {
						_zx1_l = _x2 + lengthdir_x(Sombra_Len*13, _dir_l);	//
						_zy1_l = _y1 + lengthdir_y(Sombra_Len*13, _dir_l);	//
					_zx1_r = _x2 - 5;
					_zy1_r = _y1 - 5;
				}
				if (_cam.x > _x2) {
					_zx1_l = _x2;
					_zy1_l = _y1;
						_zx1_r = _x2 + lengthdir_x(Sombra_Len*13, _dir_r);	//
						_zy1_r = _y1 + lengthdir_y(Sombra_Len*13, _dir_r);	//
				}
			}


				//Left
				if (Direc_pared == "<" || Direc_pared == "<>"){
					if ((_cam.x > _x1 and _cam.y > _y2) || ((_cam.x < _x1) and _cam.y < _y2)){
						draw_triangle(_x1-_x,	_y1-_y,			_zx1_l-_x, _zy1_l-_y,		_x1-_x,_y2-_y, 0);
						draw_triangle(_zx1_l-_x,_zy1_l-_y,		_zx2_l-_x, _zy2_l-_y,		_x1-_x,_y2-_y, 0);	
					}
				}
				//Right
				if (Direc_pared == ">" || Direc_pared == "<>"){
					if ((_cam.x < _x2 and _cam.y > _y2) || ((_cam.x > _x2) and _cam.y < _y2)){
						draw_triangle(_x2-_x,	_y1-_y,		_zx1_r-_x, _zy1_r-_y,		_x2-_x,_y2-_y, 0);
						draw_triangle(_zx1_r-_x,_zy1_r-_y,	_zx2_r-_x, _zy2_r-_y,		_x2-_x,_y2-_y, 0);
					}
				}
		}
	}
surface_reset_target()