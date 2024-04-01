if(KEY_ACCEPT){
	var _main_cluster = ArrayFindClusterID(text_clusters_array, "main");
	if( _main_cluster != noone){
		if(_main_cluster.text_obj.char_by_char_draw_end){
			timeline_ready = true;
		} else {
			_main_cluster.text_obj.ultimate_c = array_length(_main_cluster.text_obj.new_text.char);
		}
	}
}