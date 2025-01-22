# pyright: reportMissingImports=false
import json

from kitty.fast_data_types import get_boss
from kitty.tab_bar import as_rgb, draw_title
from kitty.utils import color_as_int

INDICATOR_NORMAL = "○"
INDICATOR_OVERLAY = "●"


def draw_tab(
    draw_data,
    screen,
    tab,
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
                lambda group: INDICATOR_OVERLAY
                if len(group["windows"]) > 1
                else INDICATOR_NORMAL,
                win_groups,
            )
        )
        screen.draw(" " + "".join(indicators))

    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)

    return screen.cursor.x
