/*if(keyboard_check_pressed(ord("G")) ){
	var get_col = draw_getpixel_ext(mouse_x, mouse_y)
	var blue = (get_col >> 16) & 255;
	var green = (get_col >> 8) & 255;
	var red = get_col & 255;
	show_debug_message(get_col);
	show_debug_message(" R: " + string(red) + 
					   " G: " + string(green) + 
					   " B: " + string(blue) );
}
*/
/*if(point_in_rectangle(mouse_x,mouse_y,x-16,y-16,x+16,y+16)){
	show_debug_message("Working")
}
*/
if(keyboard_check_pressed(ord("R")) ){
	window_set_size(640,360)
}