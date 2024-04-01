function GetJcon(_path){
	var _return_array = noone;
	if(file_exists(working_directory + _path)){
		var json = "";
	
		var file = file_text_open_read(working_directory + _path);
		while(file_text_eof(file) == false){	
			json += file_text_readln(file);
		}
		file_text_close(file);
		var pre_scene = json_parse(json);
		_return_array = pre_scene[0];
	}
	return _return_array;
}