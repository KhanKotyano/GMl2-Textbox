


function SceneImputImplemetor(_argumet_array, _text_clusters_array, _cur_timeline){

var a = 0;
var _cluster_array_length = array_length(_text_clusters_array);
var _aa_lenght = array_length(_argumet_array);
#region Text Cluster
	if(_argumet_array[a] == "cluster"){
		a = min(a+1,_aa_lenght-1);
		
		var _cluster_name = _argumet_array[a];
		a = min(a+1,_aa_lenght-1);
		
		switch(_argumet_array[a]){
		case "create":{
			a = min(a+1,_aa_lenght-1);
			var _cluster = ClusterParamenersReader(_argumet_array[a]);
			_cluster.ID = _cluster_name;
			array_push(_text_clusters_array,  _cluster);
		}break;
		case "add":{
			a = min(a+1,_aa_lenght-1);
			var _my_cluster = ArrayFindClusterID(_text_clusters_array, _cluster_name);
			switch(_argumet_array[a]){
			case "text":{
				a = min(a+1,_aa_lenght-1)
				if(_cluster_array_length){
					if(scene_text[$ _argumet_array[a]]!=undefined){
						var _text = scene_text[$ _argumet_array[a]];
						var _textbox_id = TextboxParamenersReader( _my_cluster.type);;
						if(_my_cluster.text_obj != noone){
							instance_destroy(_my_cluster.text_obj);
						}
						if(_my_cluster.textbox_obj == noone){
							_textbox_id = TextboxParamenersReader( _my_cluster.type);
						} else {
							_textbox_id = _my_cluster.textbox_obj.textbox;
						}
						
						with(instance_create_depth(300, 300,
												   layer_get_depth("Text"), o_charaster, {
							textbox : _textbox_id,
							text : _text,
							my_cluster : _my_cluster,
							X_offset : 0,
							Y_offset : 0,
						}) ){ 
							my_cluster.text_obj = id; 
							X = my_cluster.X;
							Y = my_cluster.Y;
						}
	
					}
				}
			}break;
			case "textbox":{
				if(_cluster_array_length){
					var _textbox_id = TextboxNum2;
					if(_my_cluster.textbox_obj != noone){
						instance_destroy(_my_cluster.textbox_obj);
					}
					a = min(a+1,_aa_lenght-1);
					_textbox_id = TextboxParamenersReader(_my_cluster.type);
					with(instance_create_depth(300,300, 
											   layer_get_depth("Textbox"),o_textbox, {
						textbox : _textbox_id,
						sprite : _textbox_id.sprite,
						my_cluster : _my_cluster,
						X_offset : 0,
						Y_offset : 0,
					}) ){ 
						my_cluster.textbox_obj = id; 
						X = my_cluster.X;
						Y = my_cluster.Y;
					}
				}
			}break;
			case "name":{
				a = min(a+1,_aa_lenght-1);
				var _name = NameList(_argumet_array[a]);
				if(_my_cluster.name_text_obj != noone or _my_cluster.name_textbox_obj != noone){
					instance_destroy(_my_cluster.name_textbox_obj);
					instance_destroy(_my_cluster.name_text_obj);
				}
				var _psudo_textbox = PsudoTextbox(TextPureGet(_name), fnt_basic_test, 
												  DEFAULT_TEXT_SEP, DEFAULT_BORDERS, DEFAULT_BORDERS, 
												  s_screen);
				
				var _y_offset = -_psudo_textbox.Height-DEFAULT_BORDERS;
				var _x_offset = DEFAULT_BORDERS;
				/*
				with(instance_create_depth(300,300, 
										   layer_get_depth("Textbox"),o_textbox, {
						textbox : _psudo_textbox,
						sprite : _psudo_textbox.sprite,
						my_cluster : _my_cluster,
						X_offset : _x_offset,
						Y_offset : _y_offset,
					}) ){ 
						my_cluster.name_textbox_obj = id; 
						X = my_cluster.X;
						Y = my_cluster.Y;
				}
				*/
				with(instance_create_depth(300, 300,
										   layer_get_depth("Text"), o_charaster, {
						textbox : _psudo_textbox,
						text : _name,
						my_cluster : _my_cluster,
						X_offset : _x_offset,
						Y_offset : _y_offset,
					}) ){ 
						my_cluster.name_text_obj = id; 
						X = my_cluster.X;
						Y = my_cluster.Y;
						
				}
			}
			}//add switch ends here
		}break;
		case "destroy":{
			if(array_length(_text_clusters_array) == 0){
				break;
			}
			a = min(a+1,_aa_lenght-1);
			var _my_cluster = ArrayFindClusterID(_text_clusters_array, _cluster_name);;
			switch(_argumet_array[a]){
			case "text":{
				if(_cluster_array_length){
					if(_my_cluster.text_obj != noone){
						instance_destroy(_my_cluster.text_obj);
					}
				}
			}break;
			case "textbox":{
				if(_cluster_array_length){
					if(_my_cluster.textbox_obj != noone){
						instance_destroy(_my_cluster.textbox_obj);
					}
				}
			}break;
			default:{
				#region text cluster destroy
				var _destroyed_cluster = _text_clusters_array[array_length(_text_clusters_array)-1];
				if(_destroyed_cluster.text_obj != noone){
					instance_destroy(_destroyed_cluster.text_obj);
				}
	
				if(_destroyed_cluster.textbox_obj != noone){
					instance_destroy(_destroyed_cluster.textbox_obj);
				}
	
				if(_destroyed_cluster.name_textbox_obj != noone){
					instance_destroy(_destroyed_cluster.name_textbox_obj);
				}
	
				if(_destroyed_cluster.name_text_obj != noone){
					instance_destroy(_destroyed_cluster.name_text_obj);
				}
	
				if(_destroyed_cluster.options_obj != noone){
					instance_destroy(_destroyed_cluster.options_obj);
				}
	
				#endregion
				array_delete(_text_clusters_array, array_length(_text_clusters_array)-1, 1);
			}
			}//add switch ends here
		}break;
		default:{
		
		}break;
		}//end of the case
			
	LINE_READ_AND_DELETE(_cur_timeline); return;}	
#endregion

#region Scene
	if(_argumet_array[a] == "scene"){
		a = min(a+1,_aa_lenght-1);
		switch(_argumet_array[a]){
		case "wait":{
			if(a != _aa_lenght-1){
				a = min(a+1,_aa_lenght-1);
				var _next_arg = _argumet_array[a];
				if(string_digits(_next_arg) == ""){
					//add for later
				} else {
					waiting_timer = real(string_digits(_next_arg)) * SECOND;
					timeline_ready = false;
				}
				
			} else {
				timeline_ready = false;
			}
		}break;
		case "destroy":{
			instance_destroy();
			return;
		}break;
		}//end of the switch
	LINE_READ_AND_DELETE(_cur_timeline); return;}

#endregion

}
	
	
function SceneImputReader(_timeline_head, _full_read){
if(_full_read){
	var _argumet_array = array_create(0); 

	var _argumet_string = "";
	_timeline_head = string_lower(_timeline_head);

	for(var c = 1;c < string_length(_timeline_head)+1;c++){
		var _char_at = string_char_at(_timeline_head, c)
		if(_char_at == ":" or _char_at == ";"){
			array_push(_argumet_array, _argumet_string);
			_argumet_string = "";
		}else {
			_argumet_string += _char_at;
		}
	}
	return _argumet_array;
} 
else {
	var _argumet_string = "";
	_timeline_head = string_lower(_timeline_head);

	for(var c = 1;c < string_length(_timeline_head)+1;c++){
		var _char_at = string_char_at(_timeline_head, c)
		if(_char_at == ":" or _char_at == ";"){
			return _argumet_string;
		}else {
			_argumet_string += _char_at;
		}
	}
	
}
}
	
function TextboxParamenersReader(_parameter){
switch(_parameter){
	case "1":{
		return TextboxNum1;
	}break;
	case "2":{
		return TextboxNum2;
	}break;	
	default:{
		return noone;
	}break;	
}
}

function ClusterParamenersReader(_parameter){
switch(_parameter){
	case "1":{
		return CLUSTER_TYPE_1;
	}break;
	case "2":{
		return CLUSTER_TYPE_2;
	}break;	
	default:{
		return CLUSTER_TYPE_1;
	}break;	
}
}
	
function DemoImputImplementor(_argumet_array, _text_clusters_array, _cur_timeline){
	
}
	