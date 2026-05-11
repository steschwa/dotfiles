import json

from kitty.fast_data_types import Screen, get_boss, get_options
from kitty.tab_bar import TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

opts = get_options()


def claude_status_to_color(status: str) -> int:
    match status:
        case "idle":
            return as_rgb(color_as_int(opts.color7))
        case "working":
            return as_rgb(color_as_int(opts.color3))
        case "blocked":
            return as_rgb(color_as_int(opts.color1))
        case _:
            return as_rgb(color_as_int(opts.inactive_tab_foreground))


def draw_right_status(screen: Screen) -> int:
    tab = get_boss().active_tab
    if tab is None:
        return screen.cursor.x

    windows = json.loads(
        str(get_boss().call_remote_control(None, ("ls", "--match-tab=state:active")))
    )[0]["tabs"][0]["windows"]

    has_claude_windows = any(
        process["cmdline"][0] == "/opt/homebrew/bin/claude"
        for window in windows
        for process in window["foreground_processes"]
        if process.get("cmdline")
    )

    formatted_session_name = f"({tab.created_in_session_name})"
    claude_status_colors = (
        [
            claude_status_to_color(window["user_vars"]["claude_status"])
            for window in windows
        ]
        if has_claude_windows
        else []
    )

    text = " ".join(
        filter(None, ["◉" * len(claude_status_colors), formatted_session_name])
    )
    text_length = len(text)

    spaces = screen.columns - screen.cursor.x - text_length
    if spaces > 0:
        screen.draw(" " * spaces)

    screen.cursor.bold = False
    screen.cursor.italic = False

    for color in claude_status_colors:
        screen.cursor.fg = color
        screen.draw("◉")

    if len(claude_status_colors) > 0:
        screen.draw(" ")

    screen.cursor.fg = as_rgb(color_as_int(opts.inactive_tab_foreground))
    screen.cursor.bold = False
    screen.cursor.italic = False
    screen.draw(formatted_session_name)

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

    ls = get_boss().call_remote_control(None, ("ls", f"--match-tab=id:{tab.tab_id}"))
    ls = json.loads(str(ls))

    ls_tab = ls[0]["tabs"][0]

    draw_win_indicator = len(ls_tab["groups"]) > 1
    if draw_win_indicator:
        indicators = []
        for window in ls_tab["windows"]:
            indicators.append("■" if window["is_active"] else "·")

        screen.draw(" " + "".join(indicators))

    if is_last:
        draw_right_status(screen)

    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)

    return screen.cursor.x
