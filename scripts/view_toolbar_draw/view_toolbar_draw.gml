/// view_toolbar_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

dx = argument0
dy = argument1
dw = argument2
dh = argument3
dy_start = dy

content_mouseon = app_mouse_box(dx, dy, dw, dh) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon
tip_force_right = true

var busy = window_busy;
window_busy = ""

if (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
	toolset_alpha_goal = 1
else
	toolset_alpha_goal = .25

window_busy = busy

draw_set_alpha(toolset_alpha)

// Background
draw_box(dx, dy, dw, dh, false, c_background, 1)
draw_dropshadow(dx, dy, dw, dh, c_black, 1)

dy += 4
dx += 4

// Add part
if (draw_button_icon("toolsetaddpart", dx, dy, 28, 28, false, e_icon.part_add, null, false, "toolsetaddpart"))
	action_element_create(e_element.PART)
dy += 28 + 4

// Add block
if (draw_button_icon("toolsetaddblock", dx, dy, 28, 28, false, e_icon.block_add, null, false, "toolsetaddblock"))
	action_element_create(e_element.BLOCK)
dy += 28 + 4

// Add plane
if (draw_button_icon("toolsetaddplane", dx, dy, 28, 28, false, e_icon.plane_add, null, false, "toolsetaddplane"))
	action_element_create(e_element.PLANE)
dy += 28 + 4

// Add plane (3d)
if (draw_button_icon("toolsetaddplane3d", dx, dy, 28, 28, false, e_icon.plane3d_add, null, false, "toolsetaddplane3d"))
	action_element_create(e_element.PLANE_3D)
dy += 28 + 4

draw_box(dx, dy, 28, 1, false, c_overlay, a_overlay)
dy += 4

// Select-only tool
tip_set_shortcut(setting_key_tool_select, setting_key_tool_select_control)
if (draw_button_icon("toolsettoolselect", dx, dy, 28, 28, tool_selected = e_tool.SELECT, e_icon.cursor, null, false, "toolsettoolselect"))
	tool_selected = e_tool.SELECT
dy += 28 + 4

// Position tool
tip_set_shortcut(setting_key_tool_move, setting_key_tool_move_control)
if (draw_button_icon("toolsettoolmove", dx, dy, 28, 28, tool_selected = e_tool.MOVE, e_icon.toolset_position, null, false, "toolsettoolmove"))
	tool_selected = e_tool.MOVE
dy += 28 + 4

// Rotate tool
tip_set_shortcut(setting_key_tool_rotate, setting_key_tool_rotate_control)
if (draw_button_icon("toolsettoolrotate", dx, dy, 28, 28, tool_selected = e_tool.ROTATE, e_icon.toolset_rotate, null, false, "toolsettoolrotate"))
{
	tool_selected = e_tool.ROTATE
	view_control_update_rot = true
}
dy += 28 + 4

// Scale tool
tip_set_shortcut(setting_key_tool_scale, setting_key_tool_scale_control)
if (draw_button_icon("toolsettoolscale", dx, dy, 28, 28, tool_selected = e_tool.SCALE, e_icon.toolset_scale, null, false, "toolsettoolscale"))
	tool_selected = e_tool.SCALE
dy += 28 + 4

// Transform tool(Position, rotate, scale)
tip_set_shortcut(setting_key_tool_transform, setting_key_tool_transform_control)
if (draw_button_icon("toolsettooltransform", dx, dy, 28, 28, tool_selected = e_tool.TRANSFORM, e_icon.transform, null, false, "toolsettooltransform"))
{
	tool_selected = e_tool.TRANSFORM
	view_control_update_rot = true
}

draw_set_alpha(1)
tip_set_shortcut(-1, false)
tip_force_right = false

// Debug info
if (debug_info)
{
	var shapes, parts, blocks, planes, planes3d;
	shapes = 0
	parts = 0
	blocks = 0
	planes = 0
	planes3d = 0
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
		{
			shapes++
			
			if (type = "plane")
			{
				if (value[e_value.EXTRUDE])
					planes3d++
				else
					planes++
			}	
			else if (type = "block")
				blocks++
		}
		else
			parts++
	}
	
	dy = dy_start
	
	var labely = 0;
	draw_label("FPS: " + string(fps), dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("FPS real: " + string(fps_real), dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Step event: " + string(step_event_time) + "ms", dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Draw event: " + string(draw_event_time) + "ms", dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 32

	draw_label("Parts: " + string(parts), dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Shapes: " + string(shapes), dx + dw + 8, dy + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("3D planes: " + string(planes3d), dx + dw + 16, dy + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Planes: " + string(planes), dx + dw + 16, dy + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Blocks: " + string(blocks), dx + dw + 16, dy + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
}
