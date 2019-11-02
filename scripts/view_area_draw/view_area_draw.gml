/// view_area_draw()

var resizemouseon;
resizemouseon = false

// Calculate area
view_area_x = panel_area_x + panel_map[?"left"].size_real + panel_map[?"left_secondary"].size_real
view_area_y = panel_area_y + (panel_area_height * (1 - setting_uv_editor_size))
view_area_width = panel_area_width - panel_map[?"left"].size_real - panel_map[?"left_secondary"].size_real - panel_map[?"right_secondary"].size_real - panel_map[?"right"].size_real
view_area_height = panel_area_height * setting_uv_editor_size

// Check for resize
if (setting_show_uv_editor && app_mouse_box(view_area_x, view_area_y - 6, view_area_width, 12))
{
	resizemouseon = true
	mouse_cursor = cr_size_ns
	
	if (mouse_left_pressed)
	{
		window_busy = "uveditorresize"
		uv_editor_resize = setting_uv_editor_size
	}
}

// Draw UV editor
if (setting_show_uv_editor)
	uv_editor_draw(view_area_x, view_area_y, view_area_width, panel_area_height * setting_uv_editor_size)

view_area_y = panel_area_y
view_area_height = test(setting_show_uv_editor, panel_area_height * (1 - setting_uv_editor_size), panel_area_height)

// Draw views
view_draw(view_main)

// Resize
if (resizemouseon)
	mouse_cursor = cr_size_ns

if (window_busy = "uveditorresize")
{
	mouse_cursor = cr_size_ns
	
	var resize = (uv_editor_resize - ((mouse_y - mouse_click_y) / panel_area_height));
	
	if (resize > .485 && resize < .515)
		setting_uv_editor_size = .5
	else
		setting_uv_editor_size = clamp(resize, .25, .75)
	
	if (mouse_still = 0)
		view_control_update_rotate()
	
	if (!mouse_left)
	{
		window_busy = ""
		app_mouse_clear()
	}
}
