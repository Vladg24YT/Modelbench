/// tab_element_editor_size()

var snapval = (setting_snap ? setting_snap_size_uv : 0.01);

tab_control(28)
textfield_group_add("elementeditorsizew", el_edit.value[e_value.WIDTH], 0, action_el_size, X, tab.size.tbx_width)

if (el_edit != null && el_edit.element_type = TYPE_SHAPE && el_edit.type = "block")
	textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.size.tbx_length)

textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.size.tbx_height)
draw_textfield_group("elementeditorsize", dx, dy, dw, snapval, -no_limit, no_limit, snapval)
tab_next()
