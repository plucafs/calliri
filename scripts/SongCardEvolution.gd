extends Control

func _on_DeleteButton_pressed():
	$ConfirmationDialog._set_position(OS.get_window_size() / 2)
#	$ConfirmationDialog._set_size(OS.get_window_size() / 2)
	$ConfirmationDialog.show()
	pass

func _on_ConfirmationDialog_confirmed():
	var song_container = get_parent().get_node(self.name)
	var song_card_path := "user://" + self.get_name() + ".tscn"
	var index = LyricsSceneManager.lyrics_scene.bsearch(song_card_path)
	LyricsSceneManager.lyrics_scene.remove(index)
	song_container.queue_free()
	delete_tscn()
	
func delete_tscn():
	var dir = Directory.new()
	dir.open("user://")
	dir.remove("user://"+self.get_name()+".tscn")

func _on_LyricSizeButton_pressed():
	$MarginContainer/HBoxContainer/TextEdit.get_font("font").size += 4
	if $MarginContainer/HBoxContainer/TextEdit.get_font("font").size > 56:
		$MarginContainer/HBoxContainer/TextEdit.get_font("font").size = 24

func _on_TitleLabel_text_changed(new_text):
	LyricsSceneManager.save_lyrics(self)
	print(self, " title saved")

func _on_AuthorLabel_text_changed(new_text):
	LyricsSceneManager.save_lyrics(self)
	print(self, " author saved")
	
func _on_AlbumLabel_text_changed(new_text):
	LyricsSceneManager.save_lyrics(self)
	print(self, " album saved")
	
func _on_TextEdit_text_changed():
	LyricsSceneManager.save_lyrics(self)
	print(self, " lyric saved")
	
	


