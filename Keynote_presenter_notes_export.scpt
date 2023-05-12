tell application "Keynote"
	activate
	tell front document
		-- Retrieve the presenter notes for all slides.
		set theNotes to presenter notes of every slide
		-- Get the name of the presentation.
		set thePresentationName to name
	end tell
end tell

set presenterNotes to ""
repeat with aNote in theNotes
	-- skip slides with empty notes
	if not (aNote) = "" then
		set presenterNotes to presenterNotes & aNote & return & return
	end if
end repeat

-- Copy the presenter notes to the clipboard
set the clipboard to presenterNotes

-- Write the presenter notes to a text file on the Desktop
do shell script "pbpaste > ~/Desktop/keynote-notes-" & quoted form of thePresentationName & ".txt"
