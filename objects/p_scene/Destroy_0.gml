LINE_DESTROY(ivents_timeline);
LINE_DESTROY(imput_line);

for(var a = 0;a < array_length(text_clusters_array);a++){
	#region text cluster destroy
	if(text_clusters_array[a].text_obj != noone){
		instance_destroy(text_clusters_array[a].text_obj);
	}
	
	if(text_clusters_array[a].textbox_obj != noone){
		instance_destroy(text_clusters_array[a].textbox_obj);
	}
	
	if(text_clusters_array[a].name_textbox_obj != noone){
		instance_destroy(text_clusters_array[a].name_textbox_obj);
	}
	
	if(text_clusters_array[a].name_text_obj != noone){
		instance_destroy(text_clusters_array[a].name_text_obj);
	}
	
	if(text_clusters_array[a].options_obj != noone){
		instance_destroy(text_clusters_array[a].options_obj);
	}
	
	#endregion
}