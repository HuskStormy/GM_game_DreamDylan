image_index = !close
timer_action(timer_funct_delay_row);

var _rot = image_angle;
_x1 = x + lengthdir_x(20,_rot+90);
_y1 = y + lengthdir_y(20,_rot+90);

_x2 = x + lengthdir_x(52,_rot+270);
_y2 = y + lengthdir_y(52,_rot+270);

coll_A = collision_circle(_x1,_y1,12,parent_entity,1,0);
coll_B = collision_circle(_x2,_y2,12,parent_entity,1,0);


coll_intro = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, parent_entity,0,0)

//oneshot_close = val_oneshot_v2(oneshot_close, close, (close == false), function(){	audio_play_sound(snd_door_open ,0,0,,,random_range(0.8,1.2))})
//

coll_entity = collision_circle(x,y,128,Entity,0,0);
if (!coll_entity and !close){
//	oneshot_close = val_oneshot_v2(oneshot_close, close, (close == true ), )
	close = true
}

#region Sonido
	oneshot_close = val_oneshot(oneshot_close, close, close == true ,	
										function()	{
														Snd_playSet(emitter, snd_door_close);
													});
	oneshot_close = val_oneshot(oneshot_close, close, close == false,
										function()	{
														Snd_playSet(emitter, snd_door_open);
													});

#endregion

if (inv_requerido != pointer_null)
	if (!instance_exists(inv_requerido)) inv_requerido = pointer_null;
	
	
if (inv_completo = true)
	Item_requerido = pointer_null;