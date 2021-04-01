extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
var gravity = 300
var speed = 75

func _ready():
	if direction == 1 :
		$enemie.flip_h = true
	$FloorDetector.position.x = $CollisionShape2D.shape.get_extents().x * direction 
func _physics_process(delta):
	if is_on_wall() or not $FloorDetector.is_colliding():
		direction = direction * -1
		$enemie.flip_h = not $enemie.flip_h
		$FloorDetector.position.x = $CollisionShape2D.shape.get_extents().x * direction 
	velocity.y += gravity
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body: Node) -> void:
	$enemie.play("squash")
	speed = 0
	set_collision_layer_bit(1, false)
	set_collision_mask_bit(0,false)
	$Topchecker.set_collision_layer_bit(4,false)
	$Topchecker.set_collision_mask_bit(0,false)
