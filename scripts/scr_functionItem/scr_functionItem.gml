#macro	ITEMID_LITERNA	0
#macro	ITEMID_MONEDAS	1
#macro	ITEMID_LLAVES	2

#macro	ITEMTYPE_EQUIPABLE	0
#macro	ITEMTYPE_COSUMIBLE	1
#macro	ITEMTYPE_USABLE		2

#macro ITEM_ID		0
#macro ITEM_NAME	1
#macro ITEM_TYPE	2
#macro ITEM_CANMAX	3
#macro ITEM_SPRITE	4

function scr_Item_get(_idItem){
	switch (_idItem) {
	    case ITEMID_LITERNA:	return [ITEMID_LITERNA, "literna", ITEMTYPE_EQUIPABLE, 1, sprtex_item]	break;
		case ITEMID_MONEDAS:	return [ITEMID_MONEDAS, "monedas", ITEMTYPE_EQUIPABLE, 50,sprtex_item_Monedas]	break;
		case ITEMID_LLAVES:		return [ITEMID_LLAVES, "LLaves",  ITEMTYPE_EQUIPABLE, 5, sprtex_item]	break;
	    default:	return [ITEMID_LITERNA, "404", ITEMTYPE_EQUIPABLE, 1]	break;
	}
}
function scr_Item_add(_idItem, _cant = 1){
	
	var _Item = scr_Item_get(_idItem);
	var _Item_pos = scr_Item_exist(_idItem);
	if (_Item_pos == -1){
		var _Item_index = [_Item[ITEM_ID], _Item[ITEM_NAME], clamp(_cant,1,_Item[ITEM_CANMAX]) ]
		ds_list_add(global.invetario, _Item_index);
	}else{
		var _item_find = ds_list_find_value(global.invetario, _Item_pos);
		var _Item_index = [_item_find[0], _item_find[1] + "nuevo", clamp(_item_find[2] + _cant, 1,_Item[ITEM_CANMAX]) ]
		ds_list_set(global.invetario, _Item_pos, _Item_index);
	}
}

function scr_Item_exist(_idItem){
	var _item = scr_Item_get(_idItem);
	var _find = _item[ITEM_ID];
	var _verifi = -1;
	var _n = ds_list_size(global.invetario);
	for (var i = 0; i < _n; ++i) {
	    var item = ds_list_find_value(global.invetario, i);
		if (item[ITEM_ID] == _find){
			_verifi = i;
			break;
		}
	}
	return _verifi;
}