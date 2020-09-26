extends RigidBody2D

func _on_RigidBody2D_body_entered(body):
	$CollisionShape2D/AudioStreamPlayer2D.play(0)
