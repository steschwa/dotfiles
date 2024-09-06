tell application "Finder"
    set selectedItems to selection
    if (count of selectedItems) is greater than 0 then
        set selectedItem to item 1 of selectedItems
        set itemPath to POSIX path of (selectedItem as alias)
        set the clipboard to itemPath
    end if
end tell
