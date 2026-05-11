import json

from kitty.fast_data_types import Screen, get_boss, get_options
from kitty.tab_bar import TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

opts = get_options()


def draw_right_status(screen: Screen) -> int:
    tab = get_boss().active_tab
    if tab is None:
        return screen.cursor.x

    text = f"({tab.created_in_session_name})"
    text_length = len(text)

    spaces = screen.columns - screen.cursor.x - text_length
    if spaces > 0:
        screen.draw(" " * spaces)

    screen.cursor.bold = False
    screen.cursor.italic = False

    screen.cursor.fg = as_rgb(color_as_int(opts.inactive_tab_foreground))
    screen.cursor.bold = False
    screen.cursor.italic = False
    screen.draw(text)

    if screen.columns - screen.cursor.x > text_length:
        screen.cursor.x = screen.columns - text_length

    return screen.cursor.x


def draw_tab(
    draw_data,
    screen: Screen,
    tab: TabBarData,
    __before__: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    __extra_data__,
) -> int:
    draw_title(draw_data, screen, tab, index, max_tab_length)

    ls = json.loads(
        str(
            get_boss().call_remote_control(None, ("ls", f"--match-tab=id:{tab.tab_id}"))
        )
    )[0]["tabs"][0]

    draw_win_indicator = len(ls["groups"]) > 1
    if draw_win_indicator:
        indicators = []
        for window in ls["windows"]:
            indicators.append("■" if window["is_active"] else "·")

        screen.draw(" " + "".join(indicators))

    if is_last:
        draw_right_status(screen)
    else:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)

    return screen.cursor.x
