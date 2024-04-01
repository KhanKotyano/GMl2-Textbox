LINE_CLEAR(copy_char_line);
LINE_COPY(copy_char_line, main_char_line);

//LINE_CLEAR(copy_tcol);
//LINE_COPY(copy_tcol, main_tcol);
draw_sprite_stretched(textbox.sprite, 0, x, y, 
					  textbox.Width, textbox.Height);

draw_set_font(new_text.base_font);
//var _line_board_sep_mod = 0;
var _m  = 0;
var _charlng = array_length(new_text.char);



var _text_up_to_char = 0;
var _current_text_w = 0;
var _cur_char_width = 0;
var _breakpoints_count = 0;
var _total_char_w_count = 0;
var _line_break_mod = 0;
for(var c = 0; c < floor(ultimate_c); c++){
	//buffer_seek(main_char_buffer, buffer_seek_start, 1*c);
	var _char = LINE_READ_AND_DELETE(copy_char_line); //buffer_read(main_char_buffer, buffer_u8)
	var _y_mod = 0;
	var _x_mod = 0;
	var _char_h = string_height(_char);
	var _tcol = tcol[c];
	var _new_tm = new_text.modification[| c][? "my"];
	#region next line y calculation
	if(line_breakpoints_exist){
		if(_total_char_w_count >= new_text.line_breakpoints[_breakpoints_count] && _line_break_mod != max_break_num){
			_breakpoints_count =min( _breakpoints_count+1, max_break_num-1);
			_line_break_mod++;
			_text_up_to_char = 0;
			ultimate_w = 0;
		}
	}
	#endregion
	
	#region Width section
	_cur_char_width = string_width(_char);
	_total_char_w_count += _cur_char_width;
	_text_up_to_char += _cur_char_width;
	_current_text_w = _text_up_to_char - _cur_char_width;
	ultimate_w = max(ultimate_w, _total_char_w_count);
	_x_mod = textbox.Width/2 - ultimate_w/2 - screen_border_x ;
	_y_mod += WavesStorage(_new_tm, c, _charlng, _char_h)
	
	#endregion
	
	
	#region Color Party and Color ivent 
	if(is_array(_tcol)){
		_tcol = ColorPaty(_tcol);
	}
	#endregion
	
	
	draw_text_transformed_color( 
		x + (_current_text_w) + _x_mod + screen_border_x ,
		y + _y_mod + (_char_h *_line_break_mod) + screen_border_y , 
		_char, 1, 1, 0, 
		_tcol, _tcol, _tcol, _tcol, 1
	); 
	last_char = c;
}
//draw_text(x - string_width("TR: ") - 100,y-100,"TR: " + new_text.ref_text);

if(!char_by_char_draw_end){
	
	#region Ivent
	var _last_char_function = new_text.modification[| last_char][? "Ivent"];
	if(_last_char_function != noone){
		_last_char_function.func(_last_char_function.argumets);
		new_text.modification[| last_char][? "Ivent"] = noone;
		show_debug_message("Ivent is activating at char: " + string(last_char) );
	}
	#endregion
	
	#region Delay
	var _last_char_delay = new_text.modification[| last_char][? "Delay"];
	ultimate_c = min( 
		clamp( ultimate_c, ultimate_c + _last_char_delay, _charlng), 
		last_char+2
	);

	if(_last_char_delay == -1){
		while(new_text.modification[| last_char][? "Delay"] = -1){
			ultimate_c++;
			last_char++;
			if(ultimate_c >= _charlng){
				char_by_char_draw_end = true;
				break;
			}
		}
	}
	#endregion
	char_by_char_draw_end = ultimate_c == _charlng;
}

merg = min(merg + 0.01, 2) * new_text.col_trigger;



