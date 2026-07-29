from typing import Any

from kitty.boss import Boss
from kitty.window import Window


def on_set_user_var(boss: Boss, _window: Window, _data: dict[str, Any]) -> None:
    for tm in boss.all_tab_managers:
        tm.mark_tab_bar_dirty()
