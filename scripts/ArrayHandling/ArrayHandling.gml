function ArrayFindClusterID(_array, _resoult){
	for(var i = 0; i < array_length(_array); i++){
		if(_array[i].ID == _resoult){
			return _array[i];
		}
	}
	show_debug_message("WRONG!!!")
	return noone;
}

