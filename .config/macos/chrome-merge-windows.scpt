if application "Google Chrome" is frontmost
    tell application "Google Chrome"
        set windowCount to count of windows

        if windowCount ≥ 2 then
            set firstWindow to first window
            set secondWindow to second window

            repeat with t in tabs of firstWindow
                set newTab to make new tab at end of tabs of secondWindow
                set URL of newTab to URL of t
            end repeat

            close firstWindow
        end if
    end tell
end if
