extends CharacterBody2D

@export var speed: float = 200.0

@onready var sprite: AnimatedSprite2D   = $AnimatedSprite2D
@onready var agent:  NavigationAgent2D  = $NavigationAgent2D

func _ready():
	sprite.play("idle")
	# Einen Frame warten, bis das NavMesh gebacken ist
	await get_tree().physics_frame

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var ziel = get_global_mouse_position()
		# RID des NavMesh abrufen
		var nav_rid = get_world_2d().navigation_map
		# Nächsten begehbaren Punkt auf dem Mesh finden
		var nächster = NavigationServer2D.map_get_closest_point(nav_rid, ziel)
		if nächster != Vector2.ZERO:
			agent.set_target_position(nächster)

func _physics_process(delta):
	if agent.is_navigation_finished():
		# Idle, wenn angekommen
		velocity = Vector2.ZERO
		if sprite.animation != "idle":
			sprite.play("idle")
	else:
		# Lauf-Phase
		var next_point = agent.get_next_path_position()
		var richtung   = (next_point - global_position).normalized()
		velocity = richtung * speed

		if sprite.animation != "walking":
			sprite.play("walking")
		sprite.flip_h = richtung.x < 0

	move_and_slide()
