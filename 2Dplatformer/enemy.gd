extends KinematicBody2D



#const WALK_SPEED = 100
#const GRAVITY = 600
#onready var player = get_node("res://2Dplatformer/Characters/Player")
#
#func _physics_process(delta):
#	if player:
#		var direction = (player.position - self.position).normalized()
#		if not is_on_floor():
#			direction.y += GRAVITY
#		move_and_slide(direction * WALK_SPEED)
#
#		for i in get_slide_count():
#			var collision = get_slide_collision(i)
#			var object = collision.collider
#			if object.is_in_group("player"):
#				object.die()
#
#
#func _on_DetectPlayer_body_entered(body):
#	if body.name == "Player":
#		player = body
#func _on_DetectPlayer_body_exited(body):
#	if body.name == "Player":
#		player = body
var move_left = true
var gravity =10
var velocity = Vector2.ZERO
var speed = 70
func _ready():
	$AnimatedSprite.animation = "idle"
#	$AnimationPlayer.play("idle")
	
func _physics_process(delta):
	move_enemy()
	detect_turn_around()

func move_enemy():
	$AnimatedSprite.animation = "run"
	
	velocity.x = -speed if move_left else speed
	velocity.y += gravity
	
	velocity= move_and_slide(velocity, Vector2.UP)	
func detect_turn_around():
	if $RayCast2D.is_colliding() or $RayCast2D2.is_colliding():
		move_left = !move_left
		scale.x = -scale.x
