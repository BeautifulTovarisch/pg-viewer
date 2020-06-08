import sys

from blessed import Terminal

from fsm.mod import initial_state
from menu.mod import draw_menu

def main():
    term = Terminal()

    with term.fullscreen(), term.cbreak():
        print(term.on_black(term.clear))

        draw_menu(initial_state, term)
        term.inkey()

if __name__ == "__main__":
    main()
