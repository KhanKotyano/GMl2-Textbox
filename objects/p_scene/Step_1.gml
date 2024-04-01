
if(scene_functional){
	if(waiting_timer != -1){
		if(waiting_timer == 1){
			timeline_ready = true;
			waiting_timer = -1;
			show_debug_message("What?");
		} else {
			waiting_timer--;
		}
	}
	var _scene_imput = "";
	var _timeline_head_r = "";
	if(!LINE_READ_EMPTY(ivents_timeline)){
		_timeline_head_r = LINE_READ_HEAD(ivents_timeline);
		_scene_imput = SceneImputReader(_timeline_head_r, false);
		}
	
	if((timeline_ready && !LINE_READ_EMPTY(ivents_timeline)) or _scene_imput == "force"){
		
		var _scene_imput_full = SceneImputReader(_timeline_head_r, true);
		show_debug_message(_scene_imput_full);
		SceneImputImplemetor(_scene_imput_full,  text_clusters_array, ivents_timeline);
	}
}