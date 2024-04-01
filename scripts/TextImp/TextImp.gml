
function TextImp(){
var _m  = 0;
var _charlng = array_length(new_text.char);


draw_set_font(fnt_basic);

var _text_up_to_char = "";

for(var c = 0; c < _charlng; c++){
	var _y_mod = 0;
	var _char_h = string_height(new_text.char[c]);

	var _new_tm = new_text.modification[| c][? "my"];

	
	 _text_up_to_char += string(new_text.char[c]);
	//Width section
	var _current_text_w = string_width(_text_up_to_char) - string_width(new_text.char[c]);
	
	if(_new_tm != noone) {_y_mod += WavesStorage(_new_tm.effect, c, _charlng, _char_h)} else {_y_mod = 0;}
	 if(new_text.modification[| c][? "ColPaty"] == noone){
		_tcol = new_text.modification[| c][? "Color"];
	 } else {
		 ColorPaty(new_text.modification[| c][? "ColPaty"])
	 }
	
	draw_text_ext_transformed_color( x + (_current_text_w) , y + _y_mod, new_text.char[c], 0, 50, 1, 1, 0,  _tcol, _tcol, _tcol, _tcol, 1); 
	
}
draw_text(x - string_width("TR: "),y-100,"TR: " + new_text.ref_text);

merg = min(merg + 0.01, 2) * new_text.col_trigger;
}

