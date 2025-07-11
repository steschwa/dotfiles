# converts a table into a VIM command to load as a quickfix list
export def "into quickfix" []: table -> nothing {
    let table = $in
    let cfile = $"/tmp/(random chars)"

    $table
    | each {|it| $"($it.path):($it.line_number):($it.text)" } 
    | to text
    | save -f $cfile

    $"cfile ($cfile)" | pbcopy
}
