/// element_event_create()
/// @desc Create event of an element.

save_id = ""
save_id = save_id_create()

name = ""
display_name = ""
name_duplicate = false
name_empty = true

element_type = TYPE_PART
type = "block"

parent = null
parent_is_selected = false

selected = false
color = make_color_hsv(random(255), 255, 255)
res = null
depth = 0

part_list = null
shape_list = null

hidden = false
tree_hidden = false
locked = false
tree_locked = false
bend_default_angle = vec3(0)

shape_vbuffer = null
extend = false
update_vbuffer = false
world_pos = point3D(0, 0, 0)

list_mouseon = false

for (var v = 0; v < e_value.amount; v++)
{
	value_default[v] = app.value_default[v]
	value_inherit[v] = value_default[v]
	value[v] = value_default[v]
}