/// view_control_move_axis(view, valueid, color, start, length, mat, axis, rotation)
/// @arg view
/// @arg valueid
/// @arg color
/// @arg start
/// @arg length
/// @arg mat
/// @arg axis
/// @arg rotation

var view, vid, color, start, length, mat, axis, rotation;
var center3D, start3D, end3D, center2D, start2D, end2D;
view = argument0
vid = argument1
color = argument2
start = argument3
length = argument4
mat = argument5
axis = vec3(argument6 = X, argument6 = Y, argument6 = Z)
rotation = argument7

center3D = point3D_mul_matrix(vec3(0), mat)
start3D = point3D_mul_matrix(start, mat)
end3D = point3D_mul_matrix(vec3_mul(axis, length), mat)

// Convert to screen
center2D = view_shape_project(center3D)
if (point3D_project_error)
	return 0

start2D = view_shape_project(start3D)
if (point3D_project_error)
	return 0

end2D = view_shape_project(end3D)
if (point3D_project_error)
	return 0

var alpha = percent(abs(vec3_dot(vec3_normalize(vec3_sub(cam_from, center3D)), vec3_normalize(vec3_sub(end3D, center3D)))), .975, .95);

if ((window_busy = "rendercontrol" && view_control_edit = vid) || view.control_mouseon_last = vid)
	alpha = 1

if (alpha = 0)
	return 0

draw_set_alpha(alpha)

// Check state
if (window_busy = "rendercontrol")
{
	if (view_control_edit != vid)
		return 0

	// Update dragging
	view_control_vec = point2D_sub(end2D, center2D)
	draw_set_color(c_white)
}
else if (view.control_mouseon_last = vid)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = vid
		view_control_edit_view = view
		view_control_value = el_edit.value[vid]
		view_control_vec = point2D_sub(end2D, center2D)
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		axis_edit = vid
		action_el_pos(el_edit.value_default[vid], false)
		app_mouse_clear()
	}
	
	draw_set_color(c_white)
}
else
	draw_set_color(color)
	
// Line
view_shape_line_draw(start2D, end2D)

//draw_primitive_begin(pr_trianglelist)

// Arrow
var size = (point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size) * .06 * view_control_ratio;
view_shape_cone_draw(mat, vec3_mul(axis, length), rotation, size)

//var ang = point_direction(start2D[X], start2D[Y], end2D[X], end2D[Y]);
//draw_image(spr_view_arrow, 0, end2D[X] * 2, end2D[Y] * 2, 2, 2, draw_get_color(), 1, ang)

// Check mouse
if (content_mouseon && point_line_distance(start2D[X], start2D[Y], end2D[X], end2D[Y], mouse_x - content_x, mouse_y - content_y) < view_3d_control_width / 2)
	view.control_mouseon = vid
	
draw_set_color(c_white)
draw_set_alpha(1)
