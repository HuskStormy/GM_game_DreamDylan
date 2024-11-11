var _x = 640 - 72;
var _y = 360 - 60;
var _inv_n = ds_list_size(global.invetario);

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_roundrect(0,0,640,360,false);
draw_set_color(c_white);
draw_set_alpha(1);

draw_sprite_ext(sprtex_background_inv_flecha,0,_x-38,_y,1, 1,0,-1,(select!=0));
draw_sprite_ext(sprtex_background_inv_flecha,0,_x+38,_y,-1,1,0,-1,(select!=_inv_n-1));

var i = select;
	var _inv_item = ds_list_find_value(global.invetario, i);
	var _item = scr_Item_get( _inv_item[0] );
    draw_sprite(_item[ITEM_SPRITE], 0, _x, _y+14);
	draw_set_halign(fa_center)
	draw_text(_x + 28, _y-2, _inv_item[2])
	draw_text(_x, _y+16, _item[ITEM_NAME])
	draw_set_halign(fa_left)

if (select!=0){
	var _inv_item = ds_list_find_value(global.invetario, select-1);
	var _item = scr_Item_get( _inv_item[0] );
	draw_sprite_ext(_item[ITEM_SPRITE], 0, _x-50, _y+32,0.3,0.3,0,-1,0.5);
}
if (select!=_inv_n-1){
	var _inv_item = ds_list_find_value(global.invetario, select+1);
	var _item = scr_Item_get( _inv_item[0] );
	draw_sprite_ext(_item[ITEM_SPRITE], 0, _x+50, _y+32,0.3,0.3,0,-1,0.5);
}


for (var i = 0; i < _inv_n; ++i) {
    var size = _inv_n*5;
	var _median = (size*i)/2;
	draw_sprite(sprtex_background_inv_size,select==i,_x+(size*i)-_median,_y+45);
}


if (menu[menu_num] = "acc"){
	draw_sprite_stretched(sprtex_background_inv_accion,0,_x-45,_y-38-68,90,60);
	draw_set_halign(fa_center)
	for (var i = 0; i < array_length(list_accion); ++i) {
		draw_set_alpha((select_accion==i)?1:0.5);
	    draw_text(_x,_y-102+(14*i),list_accion[i])
		draw_set_alpha(1);
	}
	draw_set_halign(fa_left)
}
