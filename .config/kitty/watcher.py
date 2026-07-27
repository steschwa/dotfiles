import json
from typing import Any

from kitty.boss import Boss
from kitty.child import getpid
from kitty.window import Window


def on_tab_bar_dirty(boss: Boss, _window: Window, _data: dict[str, Any]) -> None:
    sessions = set(
        t.active_session_name or t.created_in_session_name
        for t in boss.all_tabs
        if t.active_session_name or t.created_in_session_name
    )

    session_windows = {}
    for t in boss.all_tabs:
        session_name = t.active_session_name or t.created_in_session_name
        session_windows.setdefault(session_name, []).extend(w.id for w in t.windows)

    with open(f"/tmp/kitty-{getpid()}-sessions.json", "w") as file:
        json.dump(
            {
                "active_session": boss.active_session,
                "sessions": list(sessions),
                "session_windows": session_windows,
            },
            file,
        )
