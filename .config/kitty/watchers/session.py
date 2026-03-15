import json
from typing import Any

from kitty.boss import Boss
from kitty.child import getpid
from kitty.window import Window


def on_tab_bar_dirty(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    sessions = set(
        t.active_session_name or t.created_in_session_name
        for t in boss.all_tabs
        if t.active_session_name or t.created_in_session_name
    )

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
