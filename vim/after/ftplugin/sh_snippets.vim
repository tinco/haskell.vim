if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

"Snippet !env #!/usr/bin/env ${1:${TM_SCOPE/(?:source|.*)\\.(\\w+).*/$1/}}
exec "Snippet if if [[ ".st."condition".et." ]]; then<CR>".st.et."<CR>fi".st.et
exec "Snippet elif elif [[ ".st."condition".et." ]]; then<CR>".st.et
exec "Snippet for for (( ".st."i".et." = ".st.et."; ".st."i".et." ".st.et."; ".st."i".et.st.et." )); do<CR>".st.et."<CR>done".st.et
exec "Snippet case case ".st.et." in<CR>".st.et."<CR>esac".st.et
exec "Snippet while while [[ ".st.et. " ]]; do<CR>" .st.et. "<CR>done".st.et
exec "Snippet until until [[ ".st.et. " ]]; do<CR>" .st.et. "<CR>done".st.et
exec "Snippet grep grep '".st.et."' ".st.et
exec "Snippet ngrep grep -v '".st.et."' ".st.et
exec "Snippet fun ".st.et."() {<CR>".st.et."<CR>}".st.et
exec "Snippet unique uniq -u".st.et
