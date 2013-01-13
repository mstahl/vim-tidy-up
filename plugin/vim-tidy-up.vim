if exists("g:loaded_tidy_up")
  finish
end

if &compatible
  echohl ErrorMsg
  echohl none
  finish
endif

let g:loaded_tidy_up = "yessir"

function! TidyUp() range
  let lines = getline(a:firstline, a:lastline)
  let indent = indent(a:firstline)

  let table = []
  for line in lines
    let table += [ split(line, '\s*|\s*', 0) ]
  endfor

  let column_widths = []
  for i in table[-1]
    call add(column_widths, 0)
  endfor

  for row in table
    let i = 0
    for column in row
      if get(column_widths, i, 0) < len(column)
        let column_widths[i] = len(column)
      else
        let column_widths[i] = get(column_widths, i, 0)
      endif
      let i += 1
    endfor
  endfor

  let i = a:firstline
  for row in table
    let columns = []
    let j = 0
    for col in row
      call add(columns, printf("%-0" . column_widths[j] . "s", col))
      let j += 1
    endfor

    call setline(i, printf("%-0" . indent . "s", " ") . "| " . join(columns, " | ") . " |")
    let i += 1
  endfor

endfunction

vmap ,tt :call TidyUp()<CR>
