export def --env main [] {
    let search_dirs = {
        '/Users/stefan/.config/': 1,
        '/Volumes/Projekte/': 1,
        '/Volumes/Projekte/FarmAct/': 1
        '/Volumes/Projekte/doxspring/': 1
    }

    mut dirs = []
    for search_dir in ($search_dirs | columns) {
        let depth = ($search_dirs | get $search_dir)
        let found_dirs = (fd -td --max-depth $depth . $"($search_dir)" | lines)
        $dirs = ($dirs | append $found_dirs)
    }

    let selection = ($dirs | to text | fzf --reverse --height=20)
    if ($selection | is-empty) {
        return
    }

    cd $selection
    clear
}
