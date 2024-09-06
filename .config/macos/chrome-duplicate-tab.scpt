tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
end tell

if frontApp is "Google Chrome" then
    tell application "Google Chrome"
        set currentWindow to front window
        set currentTab to active tab of currentWindow
        set newTab to make new tab at end of tabs of currentWindow
        set URL of newTab to URL of currentTab
    end tell
end if
