# converts a table into a VIM command to load as a quickfix list
export def "into quickfix" []: table -> nothing {
    let cfile = $"/tmp/(random chars)"

    let table = $in 
    | select path line_number 
    | default "" text

    $table
    | each {|it| $"($it.path):($it.line_number):($it.text)" } 
    | to text
    | save -f $cfile

    $"cfile ($cfile)" | pbcopy
}
