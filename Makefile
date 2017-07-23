default:
	stow -R -t $(HOME) emacs git zsh mvn doc
ifeq ($(shell uname), Darwin)
		cp DefaultKeyBinding.dict $(HOME)/Library/KeyBindings;
endif

