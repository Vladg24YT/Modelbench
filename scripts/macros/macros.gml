/// macros()
/// @desc Defines constants used in the project.

// Debug
#macro dev_mode						false

// Versions
#macro modelbench_version			"alpha 8"
#macro modelbench_version_full		modelbench_version + ""
#macro modelbench_version_extra		""
#macro modelbench_version_date		"2019.12.4"
#macro gm_runtime					GM_runtime_version

// File formats
#macro settings_format				e_settings.FORMAT_ALPHA_2

// Directories
#macro file_directory				game_save_id
#macro data_directory				working_directory + "Data\\"
#macro models_directory				working_directory + "Models\\"
#macro fonts_directory				data_directory + "Fonts\\"
#macro languages_directory			data_directory + "Languages\\"

// Files
#macro language_file				languages_directory + "english.mblanguage"
#macro settings_file				data_directory + "settings.mbdata"
#macro recent_file					data_directory + "recent.mbdata"
#macro scenery_file					data_directory + "scenery.mbdata"
#macro log_previous_file			file_directory + "log_previous.txt"
#macro log_file						file_directory + "log.txt"
#macro temp_model_directory			file_directory + "modeltemp\\"
#macro temp_model_backup			temp_model_directory + "\\" + "temp.mbbackup1"

// Interface
#macro glow_alpha					0.45
#macro shadow_size					5
#macro shadow_alpha					0.1
#macro view_3d_control_size			0.125
#macro view_3d_control_width		20
#macro icon_button_offset			4
#macro snap_min						0.0001

// Values
#macro null							noone
#macro no_limit						100000000
#macro TYPE_PART					0
#macro TYPE_SHAPE					1

// World
#macro world_size					30000

// Vectors and matrices
#macro X							0
#macro Y							1
#macro Z							2
#macro W							3
#macro MAT_X						12
#macro MAT_Y						13
#macro MAT_Z						14
#macro MAT_IDENTITY					matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1)
