-- List of augroups
local augroups_list = {
    -- Fixes cursor issue of : 
    -- Cursor style isn't restored after exiting or suspending and resuming Nvim
    cursorReset = {
        "VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
        "VimLeave,VimSuspend * set guicursor=a:ver25-blinkon20"
    },
    -- Notifies when a file is changed outside of a buffer by some other program
    fileUpdateNotif = {
        "FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif",
        "FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
    }
}

Util.nvim_create_augroups(augroups_list)
