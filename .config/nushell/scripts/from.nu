# parses output from ripgrep
export def "from ripgrep" []: any -> table {
    lines 
    | parse "{path}:{line_number}:{text}" 
    | into int line_number
}
