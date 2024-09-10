if application "Google Chrome" is frontmost
    tell application "System Events"
        tell process "Chrome"
            click menu item "Duplicate tab" of menu "Tab" of menu bar 1
        end tell
    end tell
end if
