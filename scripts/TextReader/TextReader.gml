function TextReader(_text, _textbox){
	var _new_text = {
		ref_text : "",
		char : array_create(0),
		persona : -1,
		screen : {
			Height : _textbox.Height,
			Width : _textbox.Width,
			line_y_sep : _textbox.line_y_sep,
			sep_borders_x : _textbox.sep_borders_x,
			sep_borders_y : _textbox.sep_borders_y
		},
		char_by_char : global.defolt_delay_up,
		ref_persona : array_create(0),
		link_persona : array_create(0),
		modification : ds_list_create(),
		col_trigger : false,
		words : array_create(0),
		base_font : _textbox.font,
		line_breakpoints : array_create(0),
		char_attach_function : array_create(0), 
		
	}
	draw_set_font(_new_text.base_font);
	#region predefs
	var _global_text = _text;
	var _mod_char_t = array_create(0);
	var c = 0;
	var _delete_char = array_create(0); // delete char list
	var _delete_char_ext = array_length(_delete_char);
	var _g_text_lng = string_length(_global_text);
	var number_of_char_deleted = array_create(0);
	#endregion
	
	#region cheking for "<>"
	for(var i = 0;i < _g_text_lng ;i++){
		c++;
		if(string_char_at(_global_text, c) == "<"){
		#region before while loop
			var _entry_point = c;
			array_push(_delete_char,c);
			var _full_mod_str = "";
			var _type_str = "";
			var _spec_str = "";
			var _spec_array = array_create(0);
			var _switcher = 0;
			//show_debug_message(string(i) + "." + string(c) + "." + string(string_char_at(_global_text, c)));
			c++;
			#endregion
			
			while(string_char_at(_global_text, c) != ">" and c <= string_length(_global_text)){
				var _s_char = string_char_at(_global_text, c)
				//show_debug_message(string(i) + "." + string(c) + "." + string(_s_char));
				if(_s_char != ";"){
					if(_s_char == ":"){
						if(_switcher){ array_push(_spec_array, _spec_str)};
						_spec_str = "";
						_switcher++;
					} else if(_switcher == 0){ 
						_type_str += _s_char; 
						_full_mod_str += _s_char;
						
					} else {
						_spec_str += _s_char;
						_full_mod_str += _s_char;
					}
				} else {
					//main ivent of the loop
					array_push(_spec_array, _spec_str);
					TypeSearch(_new_text, _type_str, _spec_array);
					_spec_array = array_create(0);
					_type_str = "";
					_full_mod_str = "";
					_spec_str = "";
					_switcher = 0;
				}
				
				
				
				array_push(_delete_char, c);
				c++;
				
				
			}
			
			#region after while loop
			
			array_push(_delete_char,c);
			//show_debug_message(string(i) + "." + string(c) + "." + string(string_char_at(_global_text, c)));
			
			_delete_char_ext = array_length(_delete_char);
			
			#endregion 
		}
		i = c-1;
	}
		
	#region sub events
	for(var t = 0; t < array_length(_delete_char); t++){
		array_push(number_of_char_deleted, _delete_char[t]-t);
		_global_text = string_delete(_global_text, _delete_char[t]-t, 1);
		
	}
	
	
	var _ref_p_count = 0;
	for(var r = 1;r < string_length(_global_text)+1;r++){
		if(string_char_at(_global_text, r) == "*"){
			_global_text = string_delete(_global_text, r, 1);
			_global_text = string_insert(_new_text.ref_persona[_ref_p_count], _global_text, r);
			r += string_length(_new_text.ref_persona[_ref_p_count]);
			_ref_p_count++;
		}
		if(_ref_p_count >= array_length(_new_text.ref_persona)){
			
			break;
		}
	}
	_delete_char = array_create(0);
	_delete_char_ext = array_length(_delete_char);
	#endregion
	
	#endregion
	
	#region Cheking for "|"
	_g_text_lng = string_length(_global_text);
	c = 0;
	for(var i = 0; i < _g_text_lng; i++){
		c++;
		
		//Modification Detected
		if(string_char_at(_global_text, c) == "|"){	
			
			
			#region before while loop
			var _entry_point = c;
			array_push(_delete_char,c);
			var _full_mod_str = "";
			//show_debug_message(string(i) + "." + string(c) + "." + string(string_char_at(_global_text, c)));
			c++;
			#endregion
			//var _numer_of_character = array_length(_new_text.ref_persona);
			while(string_char_at(_global_text, c) != "|" and c <= string_length(_global_text)){
				var _s_char = string_char_at(_global_text, c)
				//show_debug_message(string(i) + "." + string(c) + "." + string(_s_char));
				if(_s_char == ";"){
					var _obj_mod = {
					mod_char: _full_mod_str,
					mod_pos : _entry_point - _delete_char_ext
					};
					array_push(_mod_char_t, _obj_mod);
					_full_mod_str = "";
				} else { _full_mod_str += _s_char; }
				
				
				
				array_push(_delete_char,c);
				c++;
				
				
			}
			
			#region after while loop
			
			array_push(_delete_char,c);
			//show_debug_message(string(i) + "." + string(c) + "." + string(string_char_at(_global_text, c)));
			
			_delete_char_ext = array_length(_delete_char);
			
			#endregion 
		} else {array_push(_new_text.char, string_char_at(_global_text, c));}
		i = c-1;
	} 
	
	
	var _text_for_ref = _global_text;
	for(var t = 0; t < array_length(_delete_char); t++){
		array_push(number_of_char_deleted, _delete_char[t]-t);
		_text_for_ref = string_delete(_text_for_ref, _delete_char[t]-t, 1);
		
	}
	#endregion
	
	#region Cheking for " "
	_g_text_lng = string_length(_text_for_ref);
	c = 0;
	var _full_word_str = "";
	for(var c = 1; c < _g_text_lng+1; c++){
		_full_word_str += string_char_at(_text_for_ref, c);
		if(string_char_at(_text_for_ref, c) == " "){	
			array_push(_new_text.words, _full_word_str);
			_full_word_str = "";
		} 
		
		
	} 
	
	array_push(_new_text.words, _full_word_str);
	_full_word_str = "";
	//var _full_word_w_w = 0;
	var _previos_breakpoint = 0;
	var _PB_count = -1;
	var _screnn_width = _new_text.screen.Width;
	var _str_word_width = 0; 
	for(var w = 0; w < array_length(_new_text.words);w++){
	
		 _str_word_width = string_width(_full_word_str) + string_width(_new_text.words[w]); //;
		 //show_debug_message(_str_word_width);
		if(_str_word_width > (_screnn_width - _new_text.screen.sep_borders_x) ){	
			
			//show_debug_message("break");
			array_push(_new_text.line_breakpoints, string_width(_full_word_str) + _previos_breakpoint );
			
			_PB_count++;
			_previos_breakpoint = _new_text.line_breakpoints[_PB_count];
			
			_full_word_str = "";
		} 
		_full_word_str += _new_text.words[w];
	} 
	
	
	#endregion
	
	#region Create DS char map/list
	var _ds_i = 0;

	_new_text.ref_text = _text_for_ref;
	
	var _n_char = array_length(_new_text.char);
	repeat(_n_char)
	{
		var _new_ds_map = ds_map_create();
		_new_ds_map[? "Color"] = c_white;
		_new_ds_map[? "ColPaty"] = noone;
		_new_ds_map[? "ColMove"] = noone;
		_new_ds_map[? "mx"] = 0;
		_new_ds_map[? "my"] = noone;
		_new_ds_map[? "Delay"] = global.base_delay;
		_new_ds_map[? "Ivent"] = noone;


		_new_text.modification[| _ds_i] = _new_ds_map;
		
		_ds_i++
	}
	
	
	#endregion
	
	TextModifier(_mod_char_t, _new_text);
	
	
	return _new_text;
}
	
	
	
	

function TextModifier(_mod_char_array, _mod_text){
	var _mod_lng = array_length(_mod_char_array);
	
	for(var s = 0; s < _mod_lng; s++){
		//var _color_mod = 0;
		var _first_char = string_char_at(_mod_char_array[s].mod_char, 1);
		var _char_full = _mod_char_array[s].mod_char;
		var _str_begin = _mod_char_array[s].mod_pos ;
		var _str_end = _mod_char_array[s].mod_pos ;
		
		switch(_first_char){
		case "c":{
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
			#region add the struct
			
				var _color = ColorStorage(_char_full);
				var mod_begin =  _str_begin;
				var mod_end =  _str_end;
			
				for(var md = _str_begin-1; md < _str_end; md++ ){
					_mod_text.modification[| md][? "Color"] = _color;	
				}
				
			#endregion
			
		}break;
			
		case "p":{
		#region for loop
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
		#endregion
		
		#region add the struct
			
				var _color = ColorPatyStorage(_char_full);
				var mod_begin =  _str_begin;
				var mod_end =  _str_end;
			
				for(var md = _str_begin-1; md < _str_end; md++ ){
					_mod_text.modification[| md][? "ColPaty"] = _color;	
				}
				_mod_text.col_trigger = true;
				
			#endregion
			
		}break;		
			
		case "w":{
		#region for loop
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
		#endregion
		
		#region add the struct

				
				var resuilt =  _char_full;
				
				for(var md = _str_begin-1; md < _str_end; md++ ){
					_mod_text.modification[| md][? "my"] =  resuilt;	
				}
				//_mod_text.col_trigger = true;
				
			#endregion
			
		}break;	
			
		case "m":{
		#region for loop
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
		#endregion
		
		#region add the struct
			
				
			var resuilt = _char_full
				
			for(var md = _str_begin-1; md < _str_end; md++ ){
				_mod_text.modification[| md][? "ColMove"] =  resuilt;	
			}
			//_mod_text.col_trigger = true;
				
		#endregion
			
		}break;
			
		case "d":{
		#region for loop
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
		#endregion
		
		#region add the struct
			
				
			var _delay = real( string_delete(_char_full, 1, 1));
			//show_debug_message(_delay);
			for(var md = _str_begin-1; md < _str_end; md++ ){
				_mod_text.modification[| md][? "Delay"] =  _delay;	
			}
			//_mod_text.col_trigger = true;
				
		#endregion
			
		}break;
		
		case "!":{
		#region for loop
			for(var u = s+1; u < _mod_lng; u++){
				if(_mod_char_array[u].mod_char == _char_full){
					_str_end = _mod_char_array[u].mod_pos-1;
					
					#region if something gone wrong
					if(_str_end <= 0){
						_str_end = 1;
					} else if(_str_end > string_length(_mod_text.ref_text)) {
						_str_end = string_length(_mod_text.ref_text);
					}
					#endregion
					
					_mod_lng = _mod_lng-1;
					
					array_delete(_mod_char_array, u, 1);
					
					break;
				}
			}
		#endregion
		
		#region add the struct
			
			var _attach_fun = noone;
			if(array_length(_mod_text.char_attach_function)){ 
				_attach_fun = _mod_text.char_attach_function[0];
				var md = _str_begin-1;
				show_debug_message(md);
				_mod_text.modification[| md][? "Ivent"] = _attach_fun;	
			}
			//show_debug_message(_delay);
			
				
			
			//_mod_text.col_trigger = true;
				
		#endregion
			
		}break;
		default:{
		
		}break;
			
			
		}
		
	}
		
}
	
function PersonaReplase(_new_text, _mod_char_t){
	var _n_char = array_length(_new_text.char);
	var _lmax_refp = array_length(_new_text.ref_persona);
	var _lcur_refp = 0;
	for(var l = 0;l < _n_char ;l++){
		var _next_persona = _new_text.ref_persona[_lcur_refp];
		if(_new_text.char[l] == "*"){
			var _next_p_array = array_create(0);
			for(var p = 1; p < string_length(_next_persona)+1;p++){
				 array_push(_next_p_array, string_char_at(_next_persona, p));
			}
			
			#region copy and paste
			var _temp_array_p = array_create(0);
			//copy temporaly array
			array_copy(_temp_array_p, 0, _new_text.char, l+1, array_length(_new_text.char)-l );
			//show_debug_message(_temp_array_p);
			
			//delete point and the rest of array
			array_delete(_new_text.char, l, array_length(_new_text.char)-l );
			//show_debug_message(_new_text.char);
			
			
			array_copy(_new_text.char, array_length(_new_text.char), 
			_next_p_array, 0, array_length(_next_p_array));
			//show_debug_message(_new_text.char);
			
			array_copy(_new_text.char, array_length(_new_text.char), 
			_temp_array_p, 0, array_length(_temp_array_p));
			//show_debug_message(_new_text.char);
			
			#endregion
			
			//_new_text.char[l] = _next_persona;
			_lcur_refp++;
			_n_char = array_length(_new_text.char);
		}
		if(_lcur_refp >= _lmax_refp){break;}
	}
	
	
}
	
	
