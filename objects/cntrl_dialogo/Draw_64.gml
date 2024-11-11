
///COLORES
var _color_base = c_white;
var _color_selc = c_lime;

//BORDES 
var _bordw = 32
var _bordh = 16
//PANTALLA
var _gui_w = 640;
var _gui_h = 360;
///LIMITE EXTERIOR
var _x1	= _bordw;
var _y1	= (_gui_h-_bordh)-(128);
var _x2	= _gui_w-_bordw;
var _y2	= _gui_h-_bordh;
///LIMITE INTERIOR
var _r = 8;
var _x1_b	= (dlg_Type!=DLGTYP_CHAR) ? (_x1+_r) : (_x1+(_y2-_y1));
var _y1_b	= _y1+_r;
var _x2_b	= _x2-_r;
var _y2_b	= _y2-_r;
var _txt_w  = _x2_b - _x1_b;


///CUADRO DE TEXTO
if (dlg_show){
	if (lct_char[FUNC_INXD] != DLGTYP_NONE){
		#region CUADRO DE TEXTO
			draw_set_color(c_black);
				draw_rectangle(_x1, _y1, _x2, _y2, false);
			draw_set_color(c_white);
		#endregion
		#region IMAGE
			if (dlg_Type = DLGTYP_CHAR) 
				draw_sprite(spr_tex_dialogo_chareger,0,_x1+4,_y1+4);
		#endregion
		#region Texto
			draw_set_font(fnt_dialogue)
			draw_text_ext(_x1_b, _y1_b, text, 22,_txt_w);
			draw_set_font(fnt_generico)
		#endregion
		#region Respuesta
			if (lct_func[FUNC_INXD] = DLG_PREGNT){
				draw_set_font(fnt_dialogue_req)
				draw_set_valign(fa_middle)
					var _c = (opcion==0) ? _color_selc : _color_base;
					draw_text_color(_x1_b+((_txt_w/2)*0)+16, _y2-24, text_opcion[0],_c,_c,_c,_c,1);
		
					var _c = (opcion==1) ? _color_selc : _color_base;
					draw_text_color(_x1_b+((_txt_w/2)*1)+16, _y2-24, text_opcion[1],_c,_c,_c,_c,1);
		
					var _c = c_lime;
					draw_circle_color(_x1_b+((_txt_w/2)*opcion)+8, _y2-24+1, 4,_c,_c,false);
				draw_set_valign(fa_top)
				draw_set_font(fnt_generico)
			}
		#endregion
		#region cosmeticos
			var _c = _color_selc;
			var _excep =  lct_func[FUNC_INXD] != DLG_DELAY and lct_func[FUNC_INXD] != DLG_CAMCORT;
			if (!timer_run(timer_delay_row) and _excep)
				draw_sprite_ext(spr_tex_dialogo_nextdialogo,0,_x2-9,_y2-9,1,1,0,_c,1);	
		#endregion	
	}else{
		draw_set_alpha(0.80);
		draw_set_color(c_black);
			draw_rectangle(0,0,_gui_w, _gui_h,false)
		draw_set_color(c_white);
		draw_set_alpha(1);
		
		draw_set_font(fnt_dialogue_req)
		draw_set_halign(fa_center)
			draw_text((_gui_w/2), _y2_b-160, text);
		draw_set_halign(fa_left)
		draw_set_font(fnt_generico)
	}
}