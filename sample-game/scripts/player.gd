extends CharacterBody2D
## Minimal player controller for the AI Studio sample project.
##
## The AI bridge can edit this file live and re-run the game to check its work.
## Try asking your assistant to "make the player faster" or "add friction".

const SPEED := 260.0


func _physics_process(_delta: float) -> void:
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	velocity = direction.normalized() * SPEED
	move_and_slide()
