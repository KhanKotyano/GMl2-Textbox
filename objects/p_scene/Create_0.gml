timeline_ready = true;
scene_functional = true;

ivents_timeline = LINE_CREATE();
imput_line = LINE_CREATE();

language = global.language;
path = $"{language}\\test_scene.json";
scene_text = noone;
background = noone;


scene_text = GetJcon(path);
//show_debug_message(working_directory + "\eng")

LINE_ADD(ivents_timeline, "Cluster:Main:Create:2;");
LINE_ADD(ivents_timeline, "Cluster:Main:Add:Text:text;");
LINE_ADD(ivents_timeline, "Cluster:Main:Add:Name:Alica;");

LINE_ADD(ivents_timeline, "Scene:Wait;");

LINE_ADD(ivents_timeline, "Cluster:Main:Add:Text:text1;");
LINE_ADD(ivents_timeline, "Cluster:Main:Add:Name:Georg;");
LINE_ADD(ivents_timeline, "Scene:Wait;");

LINE_ADD(ivents_timeline, "Cluster:Main:Add:Text:text2;");
LINE_ADD(ivents_timeline, "Scene:Wait;");

LINE_ADD(ivents_timeline, "Cluster:Main:Destroy;");
LINE_ADD(ivents_timeline, "Scene:Destroy;");

//LINE_ADD(ivents_timeline, "Force:Scene:LineReady;");


text_clusters_array = array_create(0);


waiting_timer = -1;