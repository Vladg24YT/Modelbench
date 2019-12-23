/// model_load_texture(name)
/// @arg name

var name, ext, obj;
name = argument0
obj = null

ext = filename_ext(name)
if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != "")
	return null

// See if the texture is already loaded
with (obj_texture)
{
	if (name = filename)
	{
		obj = id
		break
	}
}

// Load texture
if (obj = null)
{
	obj = new(obj_texture)
	obj.filename = name
	
	if (file_exists(load_folder + "\\" + name))
	{
		obj.sprite = texture_create_square(load_folder + "\\" + name)
		obj.filepath = load_folder + "\\" + name
	}
	else
		obj.sprite = sprite_duplicate(spr_empty)
	
	obj.size = point2D(sprite_get_width(obj.sprite), sprite_get_height(obj.sprite))
}

return obj