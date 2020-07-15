extends KinematicBody2D


var velocity : Vector2
var run_speed = 250
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
	
	if left:
		velocity.x -= run_speed
		$Sprite.flip_h = true
	
	if up:
		velocity.y -= run_speed
		$Sprite.flip_h = false
	
	if down:
		velocity.y += run_speed
		$Sprite.flip_h = true
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
