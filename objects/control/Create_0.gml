#region Celdas
	cell_size	= 16;
	cell_num_w	= room_width	div cell_size;
	cell_num_h	= room_height	div cell_size;
	global.grid_mapa	= mp_grid_create(0, 0,cell_num_w, cell_num_h, cell_size, cell_size);
#endregion


global.book_read = load_csv("book_file.csv");
#macro ESP 3
#macro ENG 4
global.idioma	= ESP;




global.invetario	= ds_list_create();
global.lavero		= ds_list_create();

scr_Item_add(ITEMID_LITERNA);
scr_Item_add(ITEMID_LITERNA);
scr_Item_add(ITEMID_LITERNA);
scr_Item_add(ITEMID_MONEDAS);
scr_Item_add(ITEMID_MONEDAS);
scr_Item_add(ITEMID_MONEDAS);
scr_Item_add(ITEMID_MONEDAS);
scr_Item_add(ITEMID_LLAVES);