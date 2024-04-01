//----reader----//
if(!textbox){
	textbox = {
		Height : 200,
		Width : 200,
		line_y_sep : 25,
		sep_borders_x : 12,
		sep_borders_y : 12,
		font : fnt_basic
	}
}

new_text = TextReader(text, textbox);
#region color
cfirst = 0 ;
csecond = 1 ;
merg = 0.10;

tcol = array_create(array_length(new_text.char));
for(var c = 0;c < array_length(new_text.char);c++){
	var _ds_map_colpaty = new_text.modification[| c][? "ColPaty"];
	if(_ds_map_colpaty == noone){
		tcol[c] =  new_text.modification[| c][? "Color"];
	} else {
		tcol[c] = _ds_map_colpaty;
	}
	
}

#endregion

#region short cut
	screen_height = new_text.screen.Height;
	screen_width = new_text.screen.Width;
	screen_border_x = new_text.screen.sep_borders_x;
	screen_border_y = new_text.screen.sep_borders_y;
	next_line_y_sep = new_text.screen.line_y_sep;
	main_char_line = LINE_CREATE();
	for(var c = 0;c < array_length(new_text.char);c++){
		var _char = new_text.char[c];
		LINE_ADD(main_char_line, _char);
	}
	copy_char_line = LINE_CREATE();
	LINE_COPY(copy_char_line, main_char_line);
#endregion

#region Buffer short cut
/*	var _string_length = array_length(new_text.char);
	main_char_buffer = buffer_create(_string_length * buffer_sizeof(buffer_s8), buffer_fast, 1);
	buffer_seek(main_char_buffer, buffer_seek_start, 0);
	for(var c = 0;c < _string_length;c++){
		var _char = new_text.char[c];
		buffer_write(main_char_buffer, buffer_s8 ,_char);
	}
	*/
#endregion

#region delay & breakpoint
ultimate_c = 0;
char_by_char_draw_end = false;
ultimate_w = 0;
if(!new_text.char_by_char){
	ultimate_c = array_length(new_text.char);
	char_by_char_draw_end = true;
} 
last_char = 0;
max_break_num = array_length(new_text.line_breakpoints);

line_breakpoints_exist = array_length(new_text.line_breakpoints);
#endregion

//show_debug_message(string_width(new_text.ref_text))
