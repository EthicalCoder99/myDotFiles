set iskeyword+=- "Enables better css syntax highlighting
setlocal foldlevelstart=99
setlocal nofoldenable
setlocal expandtab shiftwidth=2 softtabstop=2

highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/