# list the image files in a directory and preview them with kitten icat
export def 'img ls' [
    dir?: path # directory to search in (default: current directory)
]: nothing -> path {
    let root = $dir | default $env.PWD | path expand

    if ($root | path type) != 'dir' {
        error make --unspanned $'($root) is not a directory'
    }

    cd $root

    let filters = [png jpg jpeg gif webp bmp tif tiff avif heic ico svg]
    | each {|ext| ['--extension' $ext] }
    | flatten

    let images = fd --type f ...$filters | lines | sort

    if ($images | is-empty) {
        print $'no images found in ($root)'
        return
    }

    let selection = $images
    | to text
    | (fzf 
      --preview 'kitten icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}'
      --preview-window='right,70%,border-none,<120(down,50%,border-none)'
      --no-input
      --bind 'j:down,k:up'
      )
    | str trim

    if ($selection | is-empty) {
        return
    }

    $root | path join $selection
}
