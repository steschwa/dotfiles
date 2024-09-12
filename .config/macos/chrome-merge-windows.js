#!/usr/bin/env osascript -l JavaScript

const chrome = Application("Google Chrome")
chrome.includeStandardAdditions = true
if (!chrome.frontmost()) {
    throw `chrome is not frontmost`
}

const windows = chrome.windows()
if (windows.length < 2) {
    throw `requires two windows, but got ${windows.length}`
}

const [sourceWindow, destinationWindow] = windows

const urls = sourceWindow.tabs().map(tab => {
    return tab.url()
})

for (const url of urls) {
    const tab = new chrome.Tab({ url })
    destinationWindow.tabs.push(tab)
}

sourceWindow.close()

try {
    destinationWindow.activate()
} catch (e) {
    // .activate throws Error: Can't convert types. (-1700)
}
