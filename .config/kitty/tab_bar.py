# pyright: reportMissingImports=false
import json

from kitty.fast_data_types import Screen, get_boss, get_options
from kitty.tab_bar import TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

INDICATOR_NORMAL = "○"
INDICATOR_OVERLAY = "●"

opts = get_options()


def get_session_name(tab: TabBarData, max_length: int) -> str | None:
    text = tab.session_name
    if not text:
        return None

    if len(text) <= max_length:
        return text
    elif max_length >= 3:
        return text[:3]

    return None


def draw_right_status(screen: Screen, tab: TabBarData) -> int:
    max_length = screen.columns - screen.cursor.x
    text = get_session_name(tab, max_length)
    if text is None:
        return screen.cursor.x

    spaces = screen.columns - screen.cursor.x - len(text)
    if spaces > 0:
        screen.draw(" " * spaces)

    screen.cursor.fg = as_rgb(color_as_int(opts.inactive_tab_foreground))
    screen.draw(text)

    if screen.columns - screen.cursor.x > len(text):
        screen.cursor.x = screen.columns - len(text)

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

    boss = get_boss()
    ls = boss.call_remote_control(None, ("ls", f"--match-tab=id:{tab.tab_id}"))

    ls = json.loads(ls)
    win_groups = ls[0]["tabs"][0]["groups"]

    windows_count = max(list(map(lambda group: len(group["windows"]), win_groups)))
    draw_win_indicator = len(win_groups) > 1 or windows_count > 1

    if draw_win_indicator:
        indicators = list(
            map(
                lambda group: (
                    INDICATOR_OVERLAY if len(group["windows"]) > 1 else INDICATOR_NORMAL
                ),
                win_groups,
            )
        )
        screen.draw(" " + "".join(indicators))

    if is_last:
        draw_right_status(screen, tab)

    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)

    return screen.cursor.x
