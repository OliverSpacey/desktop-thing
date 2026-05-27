extends Button
class_name AppIcon

@export var icon_texture_rect : TextureRect

var parent_app : App

func assign_parent_app(app: App):
	parent_app = app
	parent_app.app_icon = self

func _on_pressed() -> void:
	if !parent_app:
		print("No app. Must create new instance")
		return
	if parent_app.visible:
		parent_app.minimise_window()
	else:
		parent_app.maximise_window()
