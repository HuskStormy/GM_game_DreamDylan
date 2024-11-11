select = 0;

list_accion =[
	"usar",
	"combinar",
	"descartar"
]
select_accion = 0;


menu=["inv", "acc"];
menu_num = 0;
audio_play_sound(snd_gui_select,0,0,,,0.5);


if (!variable_instance_exists(id, "ref_obj"))	ref_obj = pointer_null;