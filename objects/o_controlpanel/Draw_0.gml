var _sprite = s_sub;
//draw_sprite(_sprite, 0, 0, 0);
//draw_rectangle(x-16,y-16,x+16,y+16, true);


if(keyboard_check_pressed(ord("G")) ){
	ds_grid_destroy(grid);
	var _sprite_w = sprite_get_width(_sprite);
	var _sprite_h = sprite_get_height(_sprite);
	var _surface =  surface_create(_sprite_w, _sprite_h);
	surface_set_target(_surface);
	draw_sprite(_sprite, 0, 0, 0)
	
	grid = ds_grid_create(_sprite_w, _sprite_h)
	for(var w = 0; w < _sprite_w; w++){
		for(var h = 0;h < _sprite_h; h++){
			var get_col = surface_getpixel_ext(_surface,w, h);
			
			ds_grid_add(grid, w, h, get_col);
		}
	}
	surface_reset_target();
	surface_free(_surface);
	for(var w = 0; w < _sprite_w; w++){
        for(var h = 0;h < _sprite_h; h++){
            var g = ds_grid_get(grid, w, h);
			var _alpha = (g >> 24) & 255;
			var _blue = (g >> 16) & 255;
			var _green = (g >> 8) & 255;
			var _red = g & 255;
            show_debug_message("X: " + string(w) + " Y: " + string(h) );
            show_debug_message(" R: " + string(_red) + 
                               " G: " + string(_green) + 
                               " B: " + string(_blue) +
                               " A: " + string(_alpha));
        }
    }
	
}