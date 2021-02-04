extends Popup

func set_text(combination) -> void:
	$NinePatchRect/CenterContainer/NinePatchRect2/Label.text = (
		"Will you stop forgetting your acess code?! I've set it to "
		+ PoolStringArray(combination).join("") +
		", but this is the very last time!")
