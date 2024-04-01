for(var i = 0;i < ds_list_size(new_text.modification); i++){
ds_map_destroy(new_text.modification[| i]);
new_text.modification[| i] = -1;
}
ds_list_destroy(new_text.modification);
LINE_DESTROY(copy_char_line);
LINE_DESTROY(main_char_line);
//buffer_delete(main_char_buffer);