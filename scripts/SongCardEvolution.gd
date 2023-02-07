extends Control

onready var lyrics: TextEdit = $"%Lyrics"
onready var timer: Timer = $CanvasLayer/Timer
#onready var confirmation_dialog: ConfirmationDialog = $CanvasLayer/ConfirmationDialog

func _on_DeleteButton_pressed():
	$CanvasLayer/ConfirmationDialog.show()

func _on_ConfirmationDialog_confirmed():
	var song_container := get_parent().get_node(self.name)
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
	lyrics.get_font("font").size += 4
	if lyrics.get_font("font").size > 30:
		lyrics.get_font("font").size = 18

func _on_TitleLabel_text_changed(new_text):
	timer.start()


func _on_AuthorLabel_text_changed(new_text):
	timer.start()


func _on_AlbumLabel_text_changed(new_text):
	timer.start()


func _on_TextEdit_text_changed():
	timer.start()


func _on_Timer_timeout() -> void:
	LyricsSceneManager.save_lyrics(self)
	print("Scene saved")
