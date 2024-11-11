//{
//	var b_l = camera_get_view_x(view_camera[0]);
//	var b_t = camera_get_view_y(view_camera[0]);
//	var b_r = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
//	var b_d = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);



//	condiciones = (bbox_bottom < b_t) and (bbox_top > b_d) and (bbox_left > b_r) and (bbox_right < b_l);



//	_cam = obj_player;
//	if (!condiciones){
//		surface_set_target(global.Surf_Sombra);
//			Sombra_rectagular();
//			//draw_rectangle(_x1-_x,_y1-_y,_x2-_x,_y2-_y,false)
//			draw_text( 0, 0, "hola mundo")
//		surface_reset_target()
//	}
//}