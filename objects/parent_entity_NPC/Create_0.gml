// Inherit the parent event
event_inherited();
solidos = [layer_tilemap_get_id("Tiles_1"), obj_block, obj_block_secon]
move_relative = true;
point_next		= 0;
point_final_x	= x;
point_final_y	= y;
timer_wait		= timer_create(room_speed*timewait);
lista = paths;
lista_random	= path_random;

function point_accion(){
		if (point_distance(x,y,point_x, point_y) > 16){
			if (point_x != x) point_x += (x - point_x) * .3;
			if (point_y != y) point_y += (y - point_y) * .3;
		}
	}
function gridpath_init(){
		mp_grid_add_instances(control.grid_mapa, Parent_Solid, false);
		my_path = path_add();
		point_x = x;
		point_y = y;
	}

gridpath_init();



direc = directional(x,y,point_x, point_y);



timer_open_door = timer_create(room_speed * 3);
timer_set(timer_open_door)