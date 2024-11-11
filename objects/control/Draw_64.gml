draw_text(0,0,fps)
parmt = 
[
	"blk_numb: " + string( 123445 ),
	"blk_cant: " + string( 777644 )
]

//draw_dataArray(parmt, 0, 12);



draw_list(global.invetario)


//draw_text(0,100,ds_list_find_index(global.invetario, _item[ITEM_ID]))

//var _item = scr_Item_get(ITEMID_LLAVES);
//var _find = _item[ITEM_ID];
//var _verifi = -1;
//for (var i = 0; i < _n; ++i) {
//    var item = ds_list_find_value(global.invetario, i)
//	if (item[ITEM_ID] == _find){
//		_verifi = i;
//		break;
//	}
	
//}

//draw_text(0,100,_verifi)