with (tigger_salida) {
    if (other.Nombre_Door == Nombre){
		var _x = (other.x - other.point_previous.x);
		var _y = (other.y - other.point_previous.y);
		
		other.x = x;
		other.y = y;
		other.point_previous.x = x - _x;
		other.point_previous.y = y - _y;
		other.Nombre_Door = pointer_null;
	}
}

