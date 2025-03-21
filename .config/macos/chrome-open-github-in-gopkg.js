#!/usr/bin/env osascript -l JavaScript

const chrome = Application("Google Chrome")
chrome.includeStandardAdditions = true
if (!chrome.frontmost()) {
    throw `chrome is not frontmost`
}

const windows = chrome.windows()
const normalWindows = windows.filter(window => {
    return !window.name().startsWith("DevTools")
})
if (normalWindows.length > 1) {
    throw `can only operate on one window, but got ${normalWindows.length}`
}

const window = normalWindows[0]
const activeTabUrl = window.activeTab().url()

if (!activeTabUrl.startsWith("https://github.com")) {
    throw `not on github. aborting`
}

const repoUrl = activeTabUrl.substring("https://".length)
// repoUrl = github.com/foo/bar/xxx/yyy

const repoParts = repoUrl.split("/")
// repoParts = [
//   github.com
//   foo
//   bar
//   xxx
//   yyy
// ]

const pkgUrl = repoParts.slice(0, 3).join("/")
// pkgUrl = github.com/foo/bar

const pkgTab = new chrome.Tab({ url: `https://pkg.go.dev/${pkgUrl}` })

window.tabs.push(pkgTab)
