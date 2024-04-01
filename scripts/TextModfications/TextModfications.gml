function SineWave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function HalfWay (_c, _char_h, _char_length, _power) {
	var _d = 1;
	var _result = ((_c*_power)*(0 - _d)) * (((_char_length-_c)*_power)*(0 - _d));
	return _result;
}

function MessChar(_c, _char_h, _power){
	var _mess_char = (_char_h[_c]*(_c/2*_power));
	return _mess_char;

}

function BackAndForth(_c, _power){
	var _d = _c%2; 
	var _shift =0;
	if(_d){
		_shift = (_c*_power)*(0 - _d);
		return _shift;
	} else {	
		_shift = (_c*_power);
		return _shift;
	}
}
	
function ShakeString( _char_length, _power_r, _power_s){
	var _dneed = random(_power_r);
	var _shiftRT = _power_s*_dneed;
	var _resolt = _shiftRT;
	return _resolt;
}
	
	
	
function TextWave( _power, _amplitude, _c){
	
		var _y = 0;
        var OFFSET = 0.1;
        
        var time = current_time / 1000;
        _y = _amplitude * sin((time / _power + _c * OFFSET) * 2 * pi);
   
    //draw_text(_x, _y, char);

	
	/*var _halfway = sin(HalfWay(_c, _char_h, _charlng, _power));
	var _my = cos( ShakeString( _charlng, 0.5, 5) );
	var _custom_y =	SineWave(current_time / 1000, 2, _amplitude, 0);
	var _shift =  _custom_y * _halfway ;
	*/
	return _y;
}

function LongTextWave( _power, _amplitude, _c, _charlng, _char_h){
	
   
    //draw_text(_x, _y, char);

	
	var _halfway = sin(HalfWay(_c, _char_h, _charlng, _power));
//	var _my = cos( ShakeString( _charlng, 0.5, 5) );
	var _custom_y =	SineWave(current_time / 1000, 2, _amplitude, 0);
	var _shift =  _custom_y * _halfway ;
	
	return _shift;
}
	
function ColorPaty(_col_ar) constructor{
	//static cfirst = 0;
	//static csecond = 0;
	
	var _tcol = merge_color(_col_ar[cfirst], _col_ar[csecond], merg);
	if(floor(merg)){
		var _col_lng = array_length(_col_ar);
		merg = 0;
		if(cfirst >=_col_lng-1){cfirst = -1;}; 
		if(csecond >= _col_lng-1){csecond = -1;};
		cfirst = min(cfirst+1, _col_lng-1);
		csecond = min((csecond+1), _col_lng-1);

	} 
	return _tcol;
}



