/// app_event_step()

textbox_input = keyboard_string
keyboard_string = ""
step_event_time_start = current_time

app_update_window()

app_update_mouse()

app_update_keyboard()

app_update_previews()
app_update_backup()
app_update_recent()
app_update_work_camera()
app_update_caption()
app_update_snackbar()
app_update_lists()

app_update_animations()

app_update_textures()
app_update_shape_vbuffer()

if (model_create_wait)
{
	directory_create_lib(temp_model_directory)
	model_save()
	model_temporary = true
	
	model_create_wait = false
}

current_step += 60 / room_speed
step_event_time = current_time - step_event_time_start
