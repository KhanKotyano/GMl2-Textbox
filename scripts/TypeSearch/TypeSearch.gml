function TypeSearch(_new_text,_type,_subtype){
	var _a_progress = 0;
	show_debug_message(_type);
	switch(_type){
	case "ref":{
		_subtype[_a_progress] = string_lower(_subtype[_a_progress]);
		_new_text.screen = ScreenSubtype(_subtype, _a_progress);
		
	}break;
	case "p":{
		_subtype[_a_progress] = string_lower(_subtype[_a_progress]);
		var _t_search = PersonaSubtype(_subtype, _a_progress);
		array_push(_new_text.ref_persona,_t_search);
		
	}break;
	case "!local":{
		 TechnicalSetup(_new_text,_subtype, _a_progress);
		 
	}break;
	case "!global":{
		GlobalTechnicalSetup(_new_text,_subtype, _a_progress);
		
	}break;
	case "!effect":{
		//GlobalTechnicalSetup(_new_text,_subtype, _a_progress);
		EffectSetup(_new_text,_subtype, _a_progress);
	}break;
	}
}
	
function EffectSetup(_new_text,_subtype, _a_progress){
	
	switch(_subtype[_a_progress]){
	
	case "screen":{
		_a_progress++;
		var _attach_screen = {
			func : 0,
			argumets : array_create(0),
		}
		
		switch(_subtype[_a_progress]){
		case "shake":{
			_a_progress++;
			_attach_screen.func = CameraShake;
			array_push(_attach_screen.argumets, _subtype[_a_progress]);
			
			array_push(_new_text.char_attach_function, _attach_screen);
			
		
		}break;
		default:{
			_a_progress++
			show_debug_message(_subtype[_a_progress]);
		}break;	
		}
		
	}break;
	
	default:{
		_a_progress++
		show_debug_message(_subtype[_a_progress]);
	}break;	
	}
}

function ScreenSubtype(_subtype, _a_progress){

	if(_subtype[_a_progress] == "screen"){
		return 1;
	}
	
}

function PersonaSubtype(_subtype, _a_progress){
	show_debug_message(_subtype[_a_progress]);
	switch(_subtype[_a_progress]){
	case "alica":{
		return "|c5;d0.1;|Alica|c5;d0.1;|";
	}break;
	case "georg":{
		return "Georg";
	}break;	
	}
}
	
function TechnicalSetup(_new_text, _subtype, _a_progress){
	
	switch(_subtype[_a_progress]){
	case "delay":{
		_a_progress++
		var _result = _subtype[_a_progress] == "on"
		_new_text.char_by_char = _result;
		
	}break;
	
	default:{
		_a_progress++
		show_debug_message(_subtype[_a_progress]);
	}break;	
	}
}

function GlobalTechnicalSetup(_new_text, _subtype, _a_progress){
	
	switch(_subtype[_a_progress]){
	case "delay":{
		_a_progress++
		var _result = _subtype[_a_progress] == "on"
		global.defolt_delay_up = _result;
		_new_text.char_by_char = _result;
	}break;
	default:{
		_a_progress++
		show_debug_message(_subtype[_a_progress]);
	}break;	
	}
}

function NameList(_name){
switch(_name){
	case "alica":{
		//var _mod_name =  NoDelayText("|c5;|Alica|c5;|");
		return NoDelayText("|c5;|Alica|c5;|");
	}break;
	case "georg":{
		return NoDelayText("|c8;|Georg|c8;|");
	}break;
	default:{
		return NoDelayText(_name);
	}
}
}
	
function NoDelayText(_text){
	return "<!local:delay:off;>" + _text;
}

function TextPureGet(_text){
	var c = 0;
	var _new_text = _text;
	#region Delete all "<>" mod text
	for(var i = 0; i < string_length(_new_text);i++){
		c++;
		if(string_char_at(_new_text, c) == "<"){
			var _entry_point = c;
			c++;
			var d = 1;
			while(true){
				//show_debug_message(string_char_at(_new_text, c));
				c++;
				d++;
				if(c > string_length(_new_text)){break;}
				if(string_char_at(_new_text, c) == ">"){
					d++;
					break;
				}
			}
			_new_text = string_delete(_new_text, _entry_point, d);
		}
		i = c-1;
	}
	#endregion
	#region Delete all "||" mod text
	c = 0;
	for(var t = 0; t < string_length(_new_text);t++){
		c++;
		if(string_char_at(_new_text, c) == "|"){
			var _entry_point = c;
			c++;
			var d = 1;
			while(true){
				//show_debug_message(string_char_at(_new_text, c))
				if(c > string_length(_new_text)){
					show_debug_message("big break");
					break;
				}
				if(string_char_at(_new_text, c) == "|"){
					//show_debug_message("delete break");
					d++;
					break;
				}
				c++;
				d++;
			}
			_new_text = string_delete(_new_text, _entry_point, d);
		}
		t = c-1;
	}
	#endregion
	show_debug_message(string_width(_new_text));
	
	return _new_text;
}
function TextFontGetWidth(_font, _text){
	//var _prev_font = draw_get_font();
	draw_set_font(_font);
	var _str_w =  string_width(_text);
	//draw_set_font(_prev_font);
	return _str_w; 
}
function TextFontGetHeight(_font, _text){
	//var _prev_font = draw_get_font();
	draw_set_font(_font);
	var _str_h =  string_height(_text);
	//draw_set_font(_prev_font);
	return _str_h;
}
	

function PsudoTextbox(_text, _font, _text_sep, _text_y_border, _text_x_border, _sprite){
	var _text_h = TextFontGetHeight(_font, _text) + _text_y_border;
	var _text_w = TextFontGetWidth(_font, _text) + _text_x_border;
	
	var _textbox = new TextboxConstructor(_text_h + (_text_y_border), _text_w + (_text_x_border*2), _text_sep, 
										  _text_x_border, _text_y_border, _font, _sprite);
	return _textbox;
}