extends Control

var master_bus = AudioServer.get_bus_index("Master")

func _on_BGMSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value) # Replace with function body.
