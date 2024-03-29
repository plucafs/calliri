extends Control

onready var main = get_viewport().get_node("Main")
onready var color_rect = get_viewport().get_node("Main/ColorRect")
onready var dark_theme_file = preload("res://themes/dark_theme.tres")
onready var new_light_theme = preload("res://themes/new_theme_light.tres")


signal create_song

func _on_AddSongButton_pressed():
	emit_signal("create_song")
	for line_edit in $AddSongContainer.get_children():
		if line_edit is LineEdit:
			line_edit.clear()
#	$"AddSongContainer/NameLineEdit".set_text("")
#	$"AddSongContainer/AuthorLineEdit".set_text("")
#	$"AddSongContainer/AlbumLineEdit".set_text("")

func _on_ThemeButton_toggled(button_pressed):
	if button_pressed == true:
		main.set_theme(new_light_theme)
		color_rect.set_frame_color(Color("fbfbf2"))
	else:
		main.set_theme(dark_theme_file)
		color_rect.set_frame_color(Color("3a3738"))


func _on_ThemeButton2_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		main.set_theme(new_light_theme)
		color_rect.set_frame_color(Color("fbfbf2"))
	else:
		main.set_theme(dark_theme_file)
		color_rect.set_frame_color(Color("3a3738"))
