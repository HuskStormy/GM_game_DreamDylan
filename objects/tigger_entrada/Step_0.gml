coll_player = instance_place(x,y,player);


if (coll_player){
	coll_player.Nombre_Door = Nombre;
	room_goto(gotto_room);
}