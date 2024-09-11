const chrome = Application("Google Chrome")
if (!chrome.frontmost()) {
    throw `chrome is not frontmost`
}

Application("System Events")
    .applicationProcesses.byName("Google Chrome")
    .menuBars.at(0)
    .menus.byName("Tab")
    .menuItems.byName("Duplicate tab")
    .click()
