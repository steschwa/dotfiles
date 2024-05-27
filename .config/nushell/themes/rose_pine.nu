const palette = {
    base: "#232136",
    surface: "#2a273f",
    overlay: "#393552",
    muted: "#6e6a86",
    subtle: "#908caa",
    text: "#e0def4",
    love: "#eb6f92",
    gold: "#f6c177",
    rose: "#ea9a97",
    pine: "#3e8fb0",
    foam: "#9ccfd8",
    iris: "#c4a7e7",
    highlight_low: "#2a283e",
    highlight_med: "#44415a",
    highlight_high: "#56526e"
}

export def fzf [] {
    mut fzf_colors = {}

    $fzf_colors.fg = $palette.subtle
    $fzf_colors.hl = $palette.gold
    $fzf_colors.fg_line = $palette.text
    $fzf_colors.bg_line = $palette.surface
    $fzf_colors.hl_line = $palette.gold
    $fzf_colors.prompt = $palette.iris
    $fzf_colors.pointer = $palette.iris

    return $fzf_colors
}
