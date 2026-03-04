import json
from typing import Any

from kitty.boss import Boss
from kitty.child import getpid
from kitty.window import Window

NONE_SESSION_NAME = "<none>"


def on_tab_bar_dirty(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    session_to_tabs = {}

    for tab in boss.all_tabs:
        session = (
            tab.active_session_name or tab.created_in_session_name or NONE_SESSION_NAME
        )

        tab_names = session_to_tabs[session] if session in session_to_tabs else []
        tab_names.append(tab.effective_title)

        session_to_tabs[session] = tab_names

    pid = getpid()
    with open(f"/tmp/kitty-{pid}-sessions.json", "w") as file:
        json.dump(
            {
                "active_session": boss.active_session or NONE_SESSION_NAME,
                "sessions": session_to_tabs,
                "tabs": boss.active_tab_manager
                and list(
                    map(
                        lambda t: t.effective_title,
                        boss.active_tab_manager.tabs_to_be_shown_in_tab_bar,
                    )
                )
                or [],
            },
            file,
        )
