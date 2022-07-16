extends Control

var master_bus = AudioServer.get_bus_index("Master")
var bgm_bus = AudioServer.get_bus_index("BGM")
var sfx_bus = AudioServer.get_bus_index("SFX")

func _on_MasterSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value) # Replace with function body.


func _on_BGMSlider_value_changed(value):
	AudioServer.set_bus_volume_db(bgm_bus, value) # Replace with function body.


func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, value) # Replace with function body.
