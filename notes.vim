let g:notes_asset_path = expand('~/Documents/notes/_assets')

function! CopyNotesAssetFile()
    let filepath = getline('.')
    let ext = matchstr(filepath, '\.[^.]*$')

    let new_filename = substitute(system('sha1sum ' . filepath), '\s.*', '', '')
    let new_filepath = g:notes_asset_path . '/' . new_filename . ext

    let new_line = ''

    if ext =~? '\%(jpg\|jpeg\|gif\|png\)'
        let new_line = '![' . fnamemodify(filepath, ':t:r') . '](' . new_filepath . ')'
    elseif ext =~? '\%(mp4\|webm\|ogg\|mov\)'
        let new_line = '<video src="' . new_filepath . '" controls></video>'
    elseif ext =~? '\%(mp3\|wav\|ogg\|flac\)'
        let new_line = '<audio src="' . new_filepath . '" controls></audio>'
    elseif ext =~? '\%(pdf)'
        let new_line = '<embed src=' . new_filepath . ' type="application/pdf" width="100%" height="600px" />'
    endif

    if new_line != ''
        call system('mkdir -p ' . g:notes_asset_path)
        call system('cp ' . shellescape(filepath) . ' ' . shellescape(new_filepath))

        execute 's,.*,' . new_line
    endif
endfunction

nnoremap <leader>ca :call CopyNotesAssetFile()<CR>

