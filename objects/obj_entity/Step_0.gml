// Inherit the parent event
event_inherited();

if (x_pre != x) x_pre += (x - x_pre)*0.9;
if (y_pre != y) y_pre += (y - y_pre)*0.9;


if ( (x != x_pre) or (y != y_pre) )
	my_accion = accion.caminando;
else
	my_accion = accion.parado;


	 if (direc = 0)		my_view = view.right;
else if (direc = 180)	my_view = view.left;
else if (direc = 90 )	my_view = view.up;
else if (direc = 270)	my_view = view.down;
else my_view = view.right;



sprite = list_sprite[my_accion][my_view];

