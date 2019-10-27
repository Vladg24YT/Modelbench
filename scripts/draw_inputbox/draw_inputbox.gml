/// draw_inputbox(name, x, y, width, placeholder, textbox, script, [disabled, [error]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg placeholder
/// @arg textbox
/// @arg script
/// @arg [disabled
/// @arg [error]]

var inputname, xx, yy, w, placeholder, tbx, script, disabled, err, capwid, h, padding, font;
var update;

inputname = argument[0]
xx = argument[1]
yy = argument[2]
w = argument[3]
placeholder = argument[4]
tbx = argument[5]
script = argument[6]
disabled = false
err = false

if (argument_count > 7)
	disabled = argument[7]

if (argument_count > 8)
	err = argument[8]

capwid = string_width(text_get(inputname))
h = 28
padding = 3
font = null

if (xx + w < content_x || xx > content_x + content_width || yy + h < content_y || yy > content_y + content_height)
	return 0

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, w, h) && content_mouseon && (window_busy = "" || window_busy = string(tbx) + "click") && !disabled
mouseclick = mouseon && mouse_left

microani_set(string(tbx) + inputname, script, mouseon || window_focus = string(tbx), false, (mouseon && mouse_left) || (window_focus = string(tbx)))

// Field background
var bordercolor, borderalpha;
bordercolor = merge_color(c_border, c_text_secondary, mcroani_arr[e_mcroani.HOVER])
borderalpha = lerp(a_border, a_text_secondary, mcroani_arr[e_mcroani.HOVER])
bordercolor = merge_color(bordercolor, c_accent, max(mcroani_arr[e_mcroani.PRESS], mcroani_arr[e_mcroani.ACTIVE]))
borderalpha = lerp(borderalpha, a_accent, max(mcroani_arr[e_mcroani.PRESS], mcroani_arr[e_mcroani.ACTIVE]))
bordercolor = merge_color(bordercolor, c_border, mcroani_arr[e_mcroani.DISABLED])
borderalpha = lerp(borderalpha, a_border, mcroani_arr[e_mcroani.DISABLED])

if (err)
{
	bordercolor = c_error
	borderalpha = 1
}

//outlineoff = lerp(0, 1, max(mcroani_arr[e_mcroani.ACTIVE], mcroani_arr[e_mcroani.HOVER])) * (1 - mcroani_arr[e_mcroani.DISABLED])

draw_outline(xx + 1, yy + 1, w - 2, h - 2, 1, bordercolor, borderalpha)

if (err)
{
	draw_image(spr_icons, e_icon.alert, xx + w - 14, yy + h/2, 1, 1, c_error, 1)
	w -= 28
}

// Textbox
draw_set_font(font_value)

if (disabled)
{
	draw_label(string_limit(tbx.text, w - padding * 2), xx + padding + 7, yy + h - 6, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_value)
	update = false
}
else
{
	update = textbox_draw(tbx, xx + 10, yy + 6, w - 20, h - 9)
}

if (tbx.text = "" && placeholder != "")
    draw_label(string_limit(placeholder, w - padding * 2), xx + padding + 7, yy + h - 6, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_value)

// Disabled overlay
draw_box(xx, yy, w, h, false, c_overlay, a_overlay * mcroani_arr[e_mcroani.DISABLED])

if (update && (script != null))
    script_execute(script, tbx.text)

// Input boxes don't use a holding animation, but need a warning animation
microani_update(mouseon || window_focus = string(tbx), false, window_focus = string(tbx), disabled)

return update