global.base_delay = 0.6;
global.defolt_delay_up = true;
global.screen_shake = "idk";

#macro SECOND 60

#macro KEY_ACCEPT keyboard_check_pressed(vk_enter)

#macro TextForTest string_join(" ","Hello *<p:alica;> and *<p:georg;>! |c4;|This is your best freind, TestText!|c4;|", "|p0;w0;|Test text it's the best kind of text|p0;w0;|")

#macro TextboxNum1 new TextboxConstructor(200, 400, 25, 12, 12, fnt_basic_test ,s_screen)
#macro TextboxNum2 new TextboxConstructor(display_get_gui_height()/4, display_get_gui_width()-32, 25, 12, 12, fnt_basic, s_screen)

#macro DEFAULT_CLUSTER new ClusterConstructor
#macro CLUSTER_TYPE_1 new ClusterConstructor(id, display_get_gui_width()/3, display_get_gui_height()/3, "1")
#macro CLUSTER_TYPE_2 new ClusterConstructor(id, 16, display_get_gui_height() - display_get_gui_height()/4 - 16, "2")


#macro LINE_CREATE ds_queue_create
#macro LINE_READ_AND_DELETE ds_queue_dequeue
#macro LINE_ADD ds_queue_enqueue
#macro LINE_READ_HEAD ds_queue_head
#macro LINE_READ_EMPTY ds_queue_empty
#macro LINE_DESTROY ds_queue_destroy
#macro LINE_COPY ds_queue_copy
#macro LINE_CLEAR ds_queue_clear

#macro DEFAULT_TEXT_SEP 25
#macro DEFAULT_BORDERS 12
