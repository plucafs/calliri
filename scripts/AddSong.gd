extends Control

onready var main = get_viewport().get_node("Main")
onready var card_container = get_viewport().get_node("Main/UI/UIContainer/SongLyrics/TabContainer")
onready var color_rect = get_viewport().get_node("Main/ColorRect")
onready var dark_theme_file = preload("res://themes/dark_theme.tres")
onready var light_theme_file = preload("res://themes/theme.tres")


signal create_label

func _on_AddSongButton_pressed():
	emit_signal("create_label")
	$"AddSongContainer/NameLineEdit".set_text("")
	$"AddSongContainer/AuthorLineEdit".set_text("")
	$"AddSongContainer/AlbumLineEdit".set_text("")

func _on_ThemeButton_toggled(button_pressed):
	if button_pressed == true:
		main.set_theme(light_theme_file)
		color_rect.set_frame_color(Color("fbfbf2"))
	else:
		main.set_theme(dark_theme_file)
		color_rect.set_frame_color(Color("3a3738"))

func _on_SearchSongLineEdit_text_changed(new_text):
	var cards = card_container.get_children()
#	for card in cards:
#		if new_text in card.get_name():
#			card_container.current_tab = self
			
#	if new_text == "":
#		for card in cards:
#			card.visible = true
