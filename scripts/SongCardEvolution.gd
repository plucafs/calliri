extends Control

onready var lyrics: TextEdit = $"%Lyrics"
onready var title_label: LineEdit = $"%TitleLabel"
onready var author_label: LineEdit = $"%AuthorLabel"
onready var album_label: LineEdit = $"%AlbumLabel"
onready var save: Button = $"%Save"

func _ready() -> void:
	save.disabled = true
	title_label.caret_position = 0
	author_label.caret_position = 0
	album_label.caret_position = 0

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
	if save.disabled == true:
		save.disabled = false
	$"%SaveTimer".start()


func _on_AuthorLabel_text_changed(new_text):
	if save.disabled == true:
		save.disabled = false
	$"%SaveTimer".start()

func _on_AlbumLabel_text_changed(new_text):
	if save.disabled == true:
		save.disabled = false
	$"%SaveTimer".start()


func _on_TextEdit_text_changed():
	if save.disabled == true:
		save.disabled = false
	$"%SaveTimer".start()


func _on_Save_pressed() -> void:
	$"%SaveTimer".stop()
	LyricsSceneManager.save_lyrics(self)
	save.disabled = true


func _on_SaveTimer_timeout() -> void:
	LyricsSceneManager.save_lyrics(self)
	save.disabled = true
