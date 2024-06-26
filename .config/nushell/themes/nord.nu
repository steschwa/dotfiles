const palette = {
    polar_night: {
        nord0: "#2e3440",
        nord1: "#3B4252",
        nord2: "#434C5E",
        nord3: "#4C566A",
    },
    snow_storm: {
        nord4: "#D8DEE9",
        nord5: "#E5E9F0",
        nord6: "#ECEFF4",   
    },
    frost: {
        nord7: "#8FBCBB",
        nord8: "#88C0D0",
        nord9: "#81A1C1",
        nord10: "#5E81AC",
    },
    aurora: {
        nord11: "#BF616A"
        nord12: "#D08770"
        nord13: "#EBCB8B"
        nord14: "#A3BE8C"
        nord15: "#B48EAD"
    }
}

export def fzf [] {
    mut fzf_colors = {}

    $fzf_colors.fg = $palette.snow_storm.nord4
    $fzf_colors.hl = $palette.frost.nord8
    $fzf_colors.fg_line = $palette.snow_storm.nord6
    $fzf_colors.bg_line = $palette.polar_night.nord1
    $fzf_colors.hl_line = $palette.frost.nord8
    $fzf_colors.prompt = $palette.aurora.nord15
    $fzf_colors.pointer = $palette.aurora.nord14

    return $fzf_colors
}
