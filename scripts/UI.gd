extends Control

export(PackedScene) var card_scene = preload("res://scenes/SongCardEvolution.tscn")

func _ready():
	load_lyrics()
	OS.set_min_window_size(Vector2(640, 500))

func _on_AddSong_create_label():
	var song_name: String = $UIContainer/AddSong/AddSongContainer/NameLineEdit.text
	var song_author: String = $UIContainer/AddSong/AddSongContainer/AuthorLineEdit.text
	var song_album: String = $UIContainer/AddSong/AddSongContainer/AlbumLineEdit.text
	var song_lyrics: String
	
	if song_name and song_author != "":
		var card = card_scene.instance()
		card.get_node("MarginContainer/HBoxContainer/VBoxContainer/TitleLabel").text = song_name
		card.get_node("MarginContainer/HBoxContainer/VBoxContainer/AuthorLabel").text = song_author
		card.get_node("MarginContainer/HBoxContainer/VBoxContainer/AlbumLabel").text = song_album
		card.get_node("MarginContainer/HBoxContainer/TextEdit").text = song_lyrics
		card.get_node(".").set_name(song_name.rstrip("\n"))
		get_node("UIContainer/SongLyrics/TabContainer").add_child(card)
		print(card)
		LyricsSceneManager.save_lyrics(card)
	else:
		pass

func load_lyrics():
	var lyrics_array = $UIContainer/SongLyrics/LyricsSceneManager
	if lyrics_array.lyrics_scene.size() >= 1:
#		song dovrebbe essere il percorso della scena
		for song in lyrics_array.lyrics_scene:
			if !lyrics_array.lyrics_scene.empty():
				var scene = load(song).instance()
				get_node("UIContainer/SongLyrics/TabContainer").add_child(scene)
