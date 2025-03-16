extends Control

@onready var tower = preload("res://scenes/towers/tower_1/tower_1.tscn")
var currTile
var tempTower  # Przechowujemy referencję do instancji wieży

func _on_gui_input_1(event):
	var tower = preload("res://scenes/towers/tower_1/tower_1.tscn")
	if Data.save_data[GameData.current_level]["money"] > 20:
		if event is InputEventMouseButton and event.button_mask == 1:
			# Left Click Down
			tempTower = tower.instantiate()
			add_child(tempTower)

			if tempTower is Node2D:
				tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		elif event is InputEventMouseMotion and event.button_mask == 1:
			# Left Click Down Drag
			if tempTower and tempTower is Node2D:
				tempTower.global_position = event.global_position
		elif event is InputEventMouseButton and event.button_mask == 0:
			# Left Click Up
			tempTower.queue_free()
			print("Left button Up")
			Data.save_data[GameData.current_level]["money"] -= 20

			var path = get_parent()
			var properTower = tower.instantiate()
			properTower.add_child($Area)
			path.add_child(properTower)
			properTower.global_position = event.global_position
			GameEvents.emit_update_overlay(GameData.current_level)
			#tempTower.get_node("Area2D").hide()


func _on_gui_input_2(event):
	var tower = preload("res://scenes/towers/tower_2/tower_2.tscn")
	if Data.save_data[GameData.current_level]["money"] > 40:
		if event is InputEventMouseButton and event.button_mask == 1:
			# Left Click Down
			tempTower = tower.instantiate()
			add_child(tempTower)

			if tempTower is Node2D:
				tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		elif event is InputEventMouseMotion and event.button_mask == 1:
			# Left Click Down Drag
			if tempTower and tempTower is Node2D:
				tempTower.global_position = event.global_position
		elif event is InputEventMouseButton and event.button_mask == 0:
			# Left Click Up
			print("Left button Up")
			Data.save_data[GameData.current_level]["money"] -= 40

			var path = get_parent()
			var properTower = tower.instantiate()
			path.add_child(properTower)
			properTower.global_position = event.global_position
			GameEvents.emit_update_overlay(GameData.current_level)
			#tempTower.get_node("Area").hide()



func _on_gui_input_3(event):
	var tower = preload("res://scenes/towers/tower_3/tower_3.tscn")
	if Data.save_data[GameData.current_level]["money"] > 60:
		if event is InputEventMouseButton and event.button_mask == 1:
			# Left Click Down
			tempTower = tower.instantiate()
			add_child(tempTower)

			if tempTower is Node2D:
				tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		elif event is InputEventMouseMotion and event.button_mask == 1:
			# Left Click Down Drag
			if tempTower and tempTower is Node2D:
				tempTower.global_position = event.global_position
		elif event is InputEventMouseButton and event.button_mask == 0:
			# Left Click Up
			print("Left button Up")
			Data.save_data[GameData.current_level]["money"] -= 60

			var path = get_parent()
			var properTower = tower.instantiate()
			path.add_child(properTower)
			properTower.global_position = event.global_position
			GameEvents.emit_update_overlay(GameData.current_level)
			#tempTower.get_node("Area2D").hide()



func _on_gui_input_4(event):
	var tower = preload("res://scenes/towers/tower_4/tower_4.tscn")
	if Data.save_data[GameData.current_level]["money"] > 90:
		if event is InputEventMouseButton and event.button_mask == 1:
			
			# Left Click Down
			tempTower = tower.instantiate()
			add_child(tempTower)

			if tempTower is Node2D:
				tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		elif event is InputEventMouseMotion and event.button_mask == 1:
			# Left Click Down Drag
			if tempTower and tempTower is Node2D:
				tempTower.global_position = event.global_position
		elif event is InputEventMouseButton and event.button_mask == 0:
			# Left Click Up
			print("Left button Up")
			Data.save_data[GameData.current_level]["money"] -= 90

			var path = get_parent()
			var properTower = tower.instantiate()
			path.add_child(properTower)
			properTower.global_position = event.global_position
			GameEvents.emit_update_overlay(GameData.current_level)
			#tempTower.get_node("Area2D").hide()
