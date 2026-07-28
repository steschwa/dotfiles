import json

from kitty.fast_data_types import Screen, get_boss, get_options
from kitty.tab_bar import TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

opts = get_options()

# ansi palette entries, so the indicators follow whatever theme is loaded
CLAUDE_STATUS_COLORS = {
    "idle": "color2",
    "working": "color3",
    "blocked": "color1",
}
DEVSERVER_COLOR = "color2"


def session_indicators(session_name: str) -> list[tuple[str, str]]:
    windows = [
        window
        for os_window in json.loads(
            str(get_boss().call_remote_control(None, ("ls",)))
        )
        for tab in os_window["tabs"]
        for window in tab["windows"]
        if window["session_name"] == session_name
    ]

    indicators = []
    for window in windows:
        color = CLAUDE_STATUS_COLORS.get(window["user_vars"].get("claude-status"))
        if color is not None:
            indicators.append(("●", color))

    if any(w["user_vars"].get("reonic-devserver") == "true" for w in windows):
        indicators.append(("►", DEVSERVER_COLOR))

    return indicators


def draw_right_status(screen: Screen) -> int:
    tab = get_boss().active_tab
    if tab is None:
        return screen.cursor.x

    indicators = session_indicators(tab.created_in_session_name)
    text = f"({tab.created_in_session_name})"
    # each indicator is a glyph plus a trailing space
    text_length = len(text) + len(indicators) * 2

    spaces = screen.columns - screen.cursor.x - text_length
    if spaces > 0:
        screen.draw(" " * spaces)

    screen.cursor.bold = False
    screen.cursor.italic = False

    for glyph, color in indicators:
        screen.cursor.fg = as_rgb(color_as_int(getattr(opts, color)))
        screen.draw(glyph + " ")

    screen.cursor.fg = as_rgb(color_as_int(opts.inactive_tab_foreground))
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
