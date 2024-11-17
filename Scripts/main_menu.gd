extends Panel

func _on_play_button_pressed():
	MenuManager.load_menu(MenuManager.MENU_LEVEL.NONE)

func _on_exit_game_button_pressed():
	get_tree().quit()
