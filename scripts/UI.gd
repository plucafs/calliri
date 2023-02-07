extends Control

export(PackedScene) var song_card = preload("res://scenes/SongCardEvolution.tscn")
onready var song_manager: Control = $MarginContainer/UIContainer/SongManager
onready var song_options: Control = $MarginContainer/UIContainer/SongOptions

func _ready():
	song_options.get_node("AddSongContainer/SearchSongLineEdit").connect("text_changed", self, "_on_Search_Song_text_changed")
	load_lyrics()
	OS.set_min_window_size(Vector2(640, 500))

func _on_Search_Song_text_changed(input):
	var songs_tab_container = song_manager.get_node("TabContainer")
	var songs = song_manager.get_node("TabContainer").get_children()
	for song in songs:
		if input in song.get_name():
			songs_tab_container


func load_lyrics():
	if song_manager.lyrics_scene.size() >= 1:
		for song in song_manager.lyrics_scene: # scene path
			if !song_manager.lyrics_scene.empty():
				var scene = load(song).instance()
				get_node("MarginContainer/UIContainer/SongManager/TabContainer").add_child(scene)


func _on_SongOptions_create_song() -> void:
	var song_name: String = song_options.get_node("%NameLineEdit").text
	var song_author: String = song_options.get_node("%AuthorLineEdit").text
	var song_album: String = song_options.get_node("%AlbumLineEdit").text
	var song_lyrics: String
	
	if song_name and song_author != "":
		var song = song_card.instance()
		song.get_node("%TitleLabel").text = song_name
		song.get_node("%AuthorLabel").text = song_author
		song.get_node("%AlbumLabel").text = song_album
		song.get_node("%Lyrics").text = song_lyrics
		song.get_node(".").set_name(song_name.rstrip("\n"))
		get_node("MarginContainer/UIContainer/SongManager/TabContainer").add_child(song)
		print(song)
		LyricsSceneManager.save_lyrics(song)
	else: 
		return
