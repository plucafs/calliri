extends Control

export(Array) var lyrics_scene = []

func _ready():
	lyrics_scene.resize(0)
	print("Lyrics scene list size is " + str(lyrics_scene.size()))
	add_scene_to_list()
	print("Lyrics scene list size after add_scene_to_list is " + str(lyrics_scene.size()))
	
func add_scene_to_list():
	var dir = Directory.new()
	dir.open("user://")
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		file_name = dir.get_next()
		if file_name.get_extension() == "tscn":
			lyrics_scene.append("user://" + (str(file_name)))
	dir.list_dir_end()
	
	print("Lyrics scene items are: " + str(lyrics_scene))
	
func save_lyrics(node):
	var scene: PackedScene = PackedScene.new()
	scene.pack(node)
	ResourceSaver.save("user://" + node.get_name() + ".tscn", scene)
	
func _on_Card_Deleted():
	print("Card deleted")

