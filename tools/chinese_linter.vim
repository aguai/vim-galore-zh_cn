scriptencoding utf-8
" 忽略的錯誤
let g:chinese_linter_disabled_nr = get(g:,'chinese_linter_disabled_nr', [])
" 中文標點符號（更全）
let s:CHINEXE_PUNCTUATION = "\u3002\uff1f\uff01\uff0c\u3001\uff1b\uff1a\u201c\u201d\u2018\u2019\uff08\uff09\u300a\u300b\u3008\u3009\u3010\u3011\u300e\u300f\u300c\u300d\ufe43\ufe44\u3014\u3015\u2026\u2014\uff5e\ufe4f\uffe5"
" 英文標點
let s:punctuation = ','
" 中文標點符號
let s:punctuation_cn = '[\u3002\uff1b\uff0c\uff1a\u201c\u201d\uff08\uff09\u3001\uff1f\u300a\u300b]'
" 中文漢字
let s:chars_cn = '[\u4e00-\u9fa5]'
" 數字
let s:numbers = '[0-9]'
" 英文字母
let s:chars = '[a-zA-Z]'
let s:ERRORS = {
            \ 'E001' : ['中文字符後存在英文標點', s:chars_cn . s:punctuation],
            \ 'E002' : ['中英文之間沒有空格', '\(' . s:chars_cn . s:chars . '\)\|\(' . s:chars . s:chars_cn . '\)'],
            \ 'E003' : ['中文與數字之間沒有空格', '\(' . s:chars_cn . s:numbers . '\)\|\(' . s:numbers . s:chars_cn . '\)'],
            \ 'E004' : ['中文標點之後存在空格',  s:punctuation_cn . '\s\+'],
            \ 'E005' : ['行尾含有空格', '\s\+$'],
            \ }

command! -nargs=? CheckChinese call s:check(<q-args>)

function! s:check(...) abort
    let s:file = getline(1,'$')
    let s:bufnr = bufnr('%')
    let s:linenr = 0
    let s:colnr = 0
    let s:qf = []
    for l:line in s:file
        let s:linenr += 1
        call s:parser(l:line)
    endfor
    let s:linenr = 0
    let s:colnr = 0
    if !empty(s:qf)
        let g:wsd = s:qf
        call s:update_qf(s:qf)
        copen
    else
        call setqflist([])
        cclose
    endif
endfunction

function! s:parser(line) abort
    for l:error_nr in keys(s:ERRORS)
        if index(g:chinese_linter_disabled_nr, l:error_nr) == -1
            call s:find_error(l:error_nr, a:line)
        endif
    endfor
endfunction

function! s:find_error(nr, line) abort
    let l:error = s:ERRORS[a:nr]
    let s:colnr = matchend(a:line, l:error[1])
    if s:colnr != -1
        call s:add_to_qf(a:nr)
    endif
endfunction

function! s:add_to_qf(nr) abort
    let l:error_item = {
                \ 'bufnr' : s:bufnr,
                \ 'lnum' : s:linenr,
                \ 'col' : s:colnr,
                \ 'vcol' : 0,
                \ 'text' : a:nr . ' ' . s:ERRORS[a:nr][0],
                \ 'nr' : a:nr,
                \ 'type' : 'E'
                \ }
    call add(s:qf, l:error_item)
endfunction

" TODO 加入語法分析


function! s:update_qf(dict) abort
    call setqflist(a:dict)
endfunction
