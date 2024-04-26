import curses


def main(stdscr):
    # 开启鼠标事件监听
    curses.mousemask(1)

    while True:
        # 获取事件
        event = stdscr.getch()
        if event == curses.KEY_MOUSE:
            # 如果是鼠标事件，使用getmouse()获取事件详情
            _, x, y, _, _ = curses.getmouse()
            stdscr.addstr(y, x, "You clicked here!")
            stdscr.refresh()
        elif event == ord('q'):
            # 如果按下q键，退出循环
            break


# 使用curses.wrapper函数执行main函数
curses.wrapper(main)
