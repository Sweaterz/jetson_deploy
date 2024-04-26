import curses


def main(stdscr):
    # 清理屏幕
    stdscr.clear()

    stdscr.border(0)
    stdscr.addstr(12, 25, "Python curses in action!")
    # stdscr.refresh()
    # 写入一些文本
    stdscr.addstr(13, 25, "Hello, welcome to our program!\n")
    stdscr.addstr(14, 25, "Please enter your name: ")

    # 刷新屏幕以展示改变
    # stdscr.refresh()

    # 等待用户输入
    name = stdscr.getstr().decode('utf-8')

    # 将用户输入的名字展示在屏幕上
    stdscr.addstr(16, 25, f"Nice to meet you, {name}!")
    stdscr.refresh()

    # 持续等待用户输入
    stdscr.getch()


# 使用curses.wrapper函数执行main函数
curses.wrapper(main)
