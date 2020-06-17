" Language input helpers.

function! LatinMappingsEnable() abort
    inoremap á ā
    inoremap é ē
    inoremap í ī
    inoremap ó ō
    inoremap ú ū
    inoremap ü ȳ

    inoremap Á Ā
    inoremap É Ē
    inoremap Í Ī
    inoremap Ó Ō
    inoremap Ú Ū
    inoremap Ü Ȳ
endfunction

function! LatinMappingsDisable() abort
    iunmap á
    iunmap é
    iunmap í
    iunmap ó
    iunmap ú
    iunmap ü

    iunmap Á
    iunmap É
    iunmap Í
    iunmap Ó
    iunmap Ú
    iunmap Ü
endfunction
