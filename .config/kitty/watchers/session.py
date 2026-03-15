import json
from typing import Any

from kitty.boss import Boss
from kitty.child import getpid
from kitty.window import Window

NONE_SESSION_NAME = "<none>"


def on_tab_bar_dirty(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    sessions = set()

    for tab in boss.all_tabs:
        session = tab.active_session_name or tab.created_in_session_name
        if not session:
            continue

        sessions.add(session)

    with open(f"/tmp/kitty-{getpid()}-sessions.json", "w") as file:
        json.dump(
            {
                "active_session": boss.active_session,
                "sessions": list(sessions),
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
