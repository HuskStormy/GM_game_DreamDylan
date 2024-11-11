coll_player = instance_place(x,y,player);

enfocar = coll_player;
if (coll_player){
	afuera = true;
	global.cam_objetive = self;
}


if (!coll_player and afuera){
	afuera = false;
	global.cam_objetive = player;
}