#!/usr/bin/env osascript -l JavaScript

const finder = Application("Finder")

// needed for `finder.setTheClipboardTo` to work
finder.includeStandardAdditions = true

const selectedItem = finder.selection()[0]
if (!selectedItem) {
    throw "no item selected"
}

const path = selectedItem.url().substring("file://".length)
finder.setTheClipboardTo(path)
