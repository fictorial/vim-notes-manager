# Markdown Notes Manager in Vim

I keep notes as Markdown in ~/Documents/notes.

When I drag a file from OS X Finder into Vim editing a note in a terminal,
the full path to the dropped file is inserted into the note.

With the full path on the line by itself, I run a Vim function that
copies the referenced file into ~/Documents/notes/_assets/ and inserts
a Markdown image.

If I choose to, I can then generate HTML from the Markdown and have notes
that reference images.

Similarly, if I drop a video in, the source file is copied and then a `<video>`
tag is entered in its place.  Similar for audio files.

## Usage

1. `let g:notes_asset_path = /path/to/your/desired/directory`
1. `:source /path/to/notes.vim`
1. Edit a Markdown/note file in Vim
2. Drag and drop an asset file (e.g. a PNG) into Vim
3. Press `<leader>ca` (e.g. for me that's `<space>`, `c`, `a`)

## Aside: ChatGPT

I'm not super super familiar with Vimscript and don't really want to dig into
it (sorry, but I don't). I relied on ChatGPT to help generate this code...
That's a first for me and was pretty interesting. It wasn't always correct but
was certainly good enough to get started and finish the rest myself. You can
see the full transcript in the file `chatgpt3-transcript.pdf`.

<embed src="chatgpt3-transcript.pdf" type="application/pdf" width="100%" height="600px" />
