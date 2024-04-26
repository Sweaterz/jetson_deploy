import curses

# Initialization
stdscr = curses.initscr()    # Initialize the library and get a window object

curses.noecho()    # Switch off echoing of keys to the screen
curses.cbreak()    # React to keys instantly without waiting for enter key
stdscr.keypad(True)   # Enable special keys

# Write something
stdscr.addstr(0, 0, "Hello, World!")

stdscr.refresh()    # Refresh the screen to reflect changes

stdscr.getch()    # Wait for user input

# Cleanup
curses.endwin()    # Restore the terminal to its original state
