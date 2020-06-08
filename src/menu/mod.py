from blessed import Terminal

def draw_menu(state, terminal):
    for option in state['menu_options']:
        print(terminal.green_on_black(option))
