move_x		= 0;
move_y		= 0;
m_x			= 0;
m_y			= 0;
move_speed	= 4;
move_knocked = false;

solidos = [layer_tilemap_get_id("Tiles_1"), obj_block, obj_block_secon, obj_puerta, obj_esquina]

function directional(_x_sta,_y_sta,_x_fnal,_y_fnal){
	var _pnt = ( (point_direction(_x_fnal,_y_fnal,_x_sta,_y_sta)+45) div 90) * 90;
	if (_pnt = 360) _pnt = 0;
	return _pnt;
}


enum accion{ parado=0, caminando=1}
enum view{right=0, up=1, left=2, down=3}
sprite		= sprite_index;
my_accion	= accion.parado;
my_view		= view.down;
image_speed = 1.75
list_sprite = 
[
	//parado
	[spr_entity_stop_right, spr_entity_stop_up, spr_entity_stop_left, spr_entity_stop_down],
	//caminando
	[spr_entity_walk_right, spr_entity_walk_up, spr_entity_walk_left, spr_entity_walk_down]
]




coll_puerta = false;



key_accion	= false;
key_Inv		= false;

inventario = false;


mystep = false;