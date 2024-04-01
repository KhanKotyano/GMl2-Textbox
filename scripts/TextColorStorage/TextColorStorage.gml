function ColorStorage(_col_ind){
	switch(_col_ind){
	case "c0":
		return c_black;
		break;
	case "c1":
		return c_red;
		break;
	case "c2":
		return c_blue;
		break;
	case "c3":
		return c_green;
		break;
	case "c4":
		return c_yellow;
		break;
	case "c5":
		return c_aqua;
		break;
	case "c6":
		return c_lime;
		break;
	case "c7":
		return c_purple;
		break;
	case "c8":
		return c_teal;
		break;
	case "c9":
		return c_fuchsia;
		break;
	default:
		return c_white;
		break;
	
	}
}
	
function ColorPatyStorage(_col_ind){
	switch(_col_ind){
	case "p0":
		var _colp = [c_lime,c_aqua,c_red,c_yellow,c_red,c_aqua,c_blue,c_green, c_purple];
		return _colp;
		
		break;
	case "p1":
		var _colp = [c_navy, c_aqua, c_teal, c_silver];
		return _colp;
		
		break;
	case "p2":
		var _colp = [c_purple, c_fuchsia, c_maroon,c_red ];
		return _colp;
		
		break;
	case "p3":
		var _colp = [c_red, c_orange, c_yellow];
		return _colp;
		
		break;
	case "p4":
		var _colp = [c_olive, c_ltgray, c_teal, c_dkgrey];
		return _colp;
		
		break;
	case "p5":
		var _colp = [c_dkgray, c_ltgray, c_silver, c_teal];
		return _colp;
		
		break;
	case "p6":
		var _colp = [c_navy, c_aqua, c_white, c_orange, c_red, c_purple, c_fuchsia];
		return _colp;
		
		break;
	case "p7":
		var _colp = [c_gray, c_lime, c_green, c_teal];
		return _colp;
		
		break;
	case "p8":
		var _colp = [c_yellow, c_red, c_purple, c_navy];
		return _colp;
		
		break;
	case "p9":
		var _colp = [c_blue, c_yellow, c_orange, c_blue, c_red];
		return _colp;
		
		break;
	default:
		var _colp = [c_white, c_gray, c_black];
		return _colp;
		
		break;
	
	}
}
	
function WavesStorage(_col_ind, _c, _charling, _char_h){
	switch(_col_ind){
	case "w0":
		var _effect = TextWave( 0.7, 4, _c) ;
		return _effect;
		
		break;
	case "wl0":
		var _effect = LongTextWave( 3, 10, _c, _charling, _char_h) ;
		return _effect;
		
		break;
	case noone:
		return 0;
		
		break;
	default:
		var _colp = 0;
		return _colp;
		
		break;
	
	}
}