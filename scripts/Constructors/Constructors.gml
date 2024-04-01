function TextboxConstructor(_Height, _Width, 
							_line_y_sep, _sep_borders_x, _sep_borders_y, 
							_font, _sprite) constructor{
	Height = _Height;
	Width = _Width;
	line_y_sep = _line_y_sep;
	sep_borders_x = _sep_borders_x;
	sep_borders_y = _sep_borders_y;
	font = _font;
	sprite = _sprite;
}


function ClusterConstructor(_id, _x, _y, _type) constructor{
	main_scene = _id;
	text_obj = noone;
	textbox_obj = noone;
	name_text_obj = noone;
	name_textbox_obj = noone;
	options_obj = noone;
	X = _x;
	Y = _y;
	type = _type;
	ID = 0;
}