if application "Google Chrome" is frontmost
    tell application "Google Chrome"
        set currentWindow to front window
        set currentTab to active tab of currentWindow
        set newTab to make new tab at end of tabs of currentWindow
        set URL of newTab to URL of currentTab
    end tell
end if
