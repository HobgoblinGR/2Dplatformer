extends KinematicBody2D
# MALAKA GIORGO

var state = "idle" # running, falling

func dasfds():
	
	if state == "idle":
		pass
		
const GRAVITY =27
const JUMPSPEED = 400
#var MAXFALLSPEED = 300
const FLOOR = Vector2(0,-1)
var maxSpeed = 100
var fac_right = true
var screen_size
#
#func change_state(new_state):
#	if new_state == "idle":
#		to_idle()
#	elif new_state == "running":
#		to_running()

func to_running(dir):
	if dir == "right":
		velocity.x = +maxSpeed
		fac_right = true
		$AnimatedSprite.scale.x = 1
		if not $AnimatedSprite.animation == "run":
			$AnimatedSprite.animation = "run"
	elif dir == "left":
		velocity.x = -maxSpeed
		fac_right = false
		$AnimatedSprite.scale.x = -1
		if not $AnimatedSprite.animation == "run":
			$AnimatedSprite.animation = "run"

func to_idle():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.playing = true
	state = "idle"

func _ready():
	to_idle()
#	change_state("idle")

var jumped_once = false

var velocity = Vector2()
var falling = false

func to_jump():
	falling = false
	if jumped_once:
		velocity.y = 0
		velocity.y -= JUMPSPEED 
		$AnimatedSprite.animation = "doublejump"
		jumped_once = false
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		to_jump()

	if Input.is_action_pressed("ui_right"):
		to_running("right")
	elif Input.is_action_pressed("ui_left"):
		to_running("left")
	else:
		velocity.y += GRAVITY 
		velocity.y = min(velocity.y, 300)
		velocity.x = lerp(velocity.x, 0, 0.2)
		to_idle()
	pass
#	velocity.x = Vector2.ZERO.x
#	velocity.y += GRAVITY 
#	velocity.y = min(velocity.y, 300)
#
#	if Input.is_action_just_pressed("ui_up"):
#		falling = false
#		if jumped_once:
#			velocity.y = 0
#			velocity.y -= JUMPSPEED 
#			$AnimatedSprite.animation = "doublejump"
#			jumped_once = false
#
#		elif is_on_floor():
#			jumped_once = true
#			velocity.y = 0
#			velocity.y -= JUMPSPEED 
#			$AnimatedSprite.animation = "jump"
#
#	if fac_right == true:
#		$AnimatedSprite.scale.x = 1
#	else:
#		$AnimatedSprite.scale.x = -1	
#
#	if Input.is_action_pressed("ui_right"):
#		velocity.x = +maxSpeed
#		fac_right = true
#		if is_on_floor():
#			$AnimatedSprite.animation = "run"
#	elif Input.is_action_pressed("ui_left"):
#		velocity.x = -maxSpeed
#		fac_right = false
#		if is_on_floor():
#			$AnimatedSprite.animation = "run"
#	else:
#		velocity.x = lerp(velocity.x, 0, 0.09)
#
#
#		if is_on_floor() and not $AnimatedSprite.animation == "idle":
#			$AnimatedSprite.animation = "idle"
#	if velocity.y > 0:
#		falling = true
#	if falling and not is_on_floor():
#		$AnimatedSprite.animation = "fall"
#
#
#
#
#
	move_and_slide(velocity, FLOOR)
#	position.x = clamp(position.x, 0 , screen_size.x)
#	position.y = clamp(position.y, 0 , screen_size.y)
func die():
	queue_free()	
