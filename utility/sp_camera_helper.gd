extends Node

func _ready() -> void:
	process_priority = 10000

func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if not camera:
		return

	var zoom = camera.zoom.x

	var center_position = camera.get_screen_center_position()
	var top_left_position = center_position - Vector2(camera.get_viewport_rect().size) / zoom / 2.0

	var offset = Vector2(
		fmod(top_left_position.x, zoom),
		fmod(top_left_position.y, zoom)
	)

	RenderingServer.global_shader_parameter_set("sp_camera_offset", offset)
	RenderingServer.global_shader_parameter_set("sp_camera_zoom", zoom)
