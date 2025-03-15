extends Node

#@onready var bg_music = $MenuAudioStreamPlayer
@onready var bg_sfx = $SFXAudioStreamPlayer
@onready var bg_music = $SFXAudioStreamPlayer

func _ready() -> void:
	bg_music.volume_db = -25
	bg_sfx.volume_db = -25

func play_music():
	bg_music.play()

func set_music_volume(value: float):
	bg_music.volume_db = -100 if value == -50 else value

func play_sfx(sound: AudioStream):
	bg_sfx.play()

func set_sfx_volume(value: float):
	bg_sfx.volume_db = -100 if value == -50 else value
