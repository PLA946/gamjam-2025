extends Node

@onready var bg_music: AudioStreamPlayer = $MenuAudioStreamPlayer
@onready var bg_sfx: AudioStreamPlayer = $SFXAudioStreamPlayer

var playlist: Array[AudioStream] = [
	preload("res://assets/audio/galway.mp3"),
	preload("res://assets/audio/celtic_impulse.mp3"),
	preload("res://assets/audio/defending_the_village.mp3")
]
var current_track_index: int = 0

func _ready() -> void:
	AudioControler.play_music(randi_range(0, AudioControler.playlist.size()-1))
	if AudioControler.bg_music.stream == null:
		AudioControler.play_music(0)
	bg_music.volume_linear = 0.3
	bg_sfx.volume_linear = 0.3
	
	bg_music.finished.connect(_on_music_finished)

func play_music(song_index: int = 0):
	if song_index >= 0 and song_index < playlist.size():
		current_track_index = song_index
		bg_music.stream = playlist[current_track_index]
		bg_music.play()

func _on_music_finished():
	current_track_index = (current_track_index + 1) % playlist.size()
	bg_music.stream = playlist[current_track_index]
	bg_music.play()

func set_music_volume(value: float):
	bg_music.volume_linear = value

func play_sfx(sound: AudioStream):
	bg_sfx.stream = sound
	bg_sfx.play()

func set_sfx_volume(value: float):
	bg_sfx.volume_linear = value
