#macro FUNC_INXD 0
#macro FUNC_ARG_A 1
#macro FUNC_ARG_B 2

#macro DLGTYP_NONE	"NULL"
#macro DLGTYP_NORM	"NORMAL"
#macro DLGTYP_CHAR	"char"

#macro DLG_START	"Start"
#macro DLG_FINAL	"Final"
#macro DLG_TEXT		"Text"
#macro DLG_DIALGHOW	"DialgShow"
#macro DLG_DELAY	"Delay"
#macro DLG_ROW		"Row"
#macro DLG_COMENT	"Coment"
#macro DLG_PREGNT	"Prgunta"
#macro DLG_TXTDLY	"TextDelay"

#macro DLG_FUNCT	"Funct"
#macro DLG_CAMCORT	"CamCortina"


// dlg_ini => el argumento
dlg_show = true;
dlg_Type = DLGTYP_NORM;
row_inx = dlg_ini;


lct_func	= dialogo_funct(row_inx);
lct_char	= dialogo_chara(row_inx);
text		= dialogo_index(row_inx);


opcion = 0;
text_opcion[0] = "";
text_opcion[1] = "";




timer_delay_row = timer_create(30);
timer_set(timer_delay_row);


funct_delay_timer = timer_create(room_speed * 10);
funct_delay = false;


function event_NextRow(){
		row_inx++;
		text	= dialogo_index(row_inx);
		lct_char= dialogo_chara(row_inx);
		lct_func= dialogo_funct(row_inx);
}
function event_GottoRow(_row_index){
		row_inx = _row_index;
		text	= dialogo_index(_row_index);
		lct_char= dialogo_chara(_row_index);
		lct_func= dialogo_funct(_row_index);
}
function event_ARG_BOOL(_ARG){
	var _val = true;
	
	if (lct_func[_ARG] = "" || lct_func[_ARG] = "True")
		return true;
	if (lct_func[_ARG] = "False")
		return false;
}
function func_gotto(_INX, _AGR_A=0, _AGR_B=0){
	lct_func[FUNC_INXD] = _INX;
	lct_func[FUNC_ARG_A] = _AGR_A;
	lct_func[FUNC_ARG_B] = _AGR_B;
}