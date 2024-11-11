move_knocked = !instance_exists(cntrl_dialogo);


depth = -bbox_bottom;
if (my_view = view.down)		{m_x = 0; m_y = 1;}
else if (my_view = view.up)		{m_x = 0; m_y = -1;}
else if (my_view = view.left)	{m_x = -1; m_y = 0;}
else if (my_view = view.right)	{m_x = 1; m_y = 0;}

coll_puerta = instance_place(x + sign(m_x),y + sign(m_y),obj_puerta)


if (my_accion = accion.caminando){
	if ((round(image_index)=1) || (round(image_index)=3)){
	if (mystep = false)
		audio_play_sound(snd_step,1,0,,,random_range(0.7,1.3));
		mystep = true;
	}else{
		mystep = false;
	}

}