import json
from typing import Any

from kitty.boss import Boss
from kitty.child import getpid
from kitty.window import Window


def on_tab_bar_dirty(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    session_to_tabs = {}

    for tab in boss.all_tabs:
        session = tab.active_session_name or "default"

        tab_names = session_to_tabs[session] if session in session_to_tabs else []
        tab_names.append(tab.effective_title)

        session_to_tabs[session] = tab_names

    pid = getpid()
    with open(f"/tmp/kitty-{pid}-sessions.json", "w") as file:
        json.dump(session_to_tabs, file)
