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
  let line = getline(a:firstline)
  if match(line, "\|.*\|") != -1
    call TidyUpTable(a:firstline, a:lastline)
  elseif match(line, "=>") != -1
    call TidyUpHashrockets(a:firstline, a:lastline)
  elseif match(line, ":.*,\s*$") != -1
    call TidyUpHashKeys(a:firstline, a:lastline)
  elseif match(line, "=") != -1
    call TidyUpAssignments(a:firstline, a:lastline)
  endif

  call TidyUpComments(a:firstline, a:lastline)
endfunction

function! TidyUpAssignments(start, end)
  let lines = getline(a:start, a:end)
  let indent = indent(a:start)
  if match(lines[0], '=') == -1
    return
  endif

  let max_lhs_length = 0
  for line in lines
    if match(line, "=") == -1
      echo line
      cont
    end
    let [lhs, rhs] = split(line, "\\s*=\\s*")
    if len(lhs) > max_lhs_length
      let max_lhs_length = len(lhs)
    endif
  endfor

  let line_no = a:start

  for line in lines
    let [lhs, rhs] = split(line, "\\s*=\\s*")
    call setline(line_no, printf("%-0" . max_lhs_length . "s = %s", lhs, rhs))
    let line_no += 1
  endfor
endfunction

function! TidyUpComments(start, end)
  let lines = getline(a:start, a:end)
  if match(lines[0], '#') == -1
    return
  endif
  let max_lhs_length = 0
  for line in lines
    let [lhs, rhs] = split(line, "\\s*#\\s*")
    if len(lhs) > max_lhs_length
      let max_lhs_length = len(lhs)
    endif
  endfor

  let line_no = a:start
  for line in lines
    let [lhs, rhs] = split(line, "\\s*#\\s*")
    call setline(line_no, printf("%-0" . max_lhs_length . "s # %s", lhs, rhs))
    let line_no += 1
  endfor
endfunction

function! TidyUpHashKeys(start, end)
  let lines = getline(a:start, a:end)
  let indent = indent(a:start)

  let max_lhs_length = 0
  for line in lines
    let [lhs, rhs] = split(line, "\s*:\s*")
    if len(lhs) > max_lhs_length
      let max_lhs_length = len(lhs)
    endif
  endfor

  let line_no = a:start
  for line in lines
    let [lhs, rhs] = split(line, "\s*:\s*")
    call setline(line_no, printf("%-0" . (max_lhs_length + 1) . "s%s", lhs . ':', rhs))
    let line_no += 1
  endfor
endfunction

function! TidyUpHashrockets(start, end)
  let lines = getline(a:start, a:end)
  let indent = indent(a:start)

  let max_lhs_length = 0
  for line in lines
    let [lhs, rhs] = split(line, "\s*=>\s*")
    if len(lhs) > max_lhs_length
      let max_lhs_length = len(lhs)
    endif
  endfor

  let line_no = a:start

  for line in lines
    let [lhs, rhs] = split(line, "\s*=>\s*")
    call setline(line_no, printf("%-0" . max_lhs_length . "s=>%s", lhs, rhs))
    let line_no += 1
  endfor
endfunction

function! TidyUpTable(start, end)
  let lines = getline(a:start, a:end)
  let indent = indent(a:start)

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
      call add(columns, printf("%-" . column_widths[j] . "s", col))
      let j += 1
    endfor

    call setline(i, printf("%" . indent . "s", "") . "| " . join(columns, " | ") . " |")
    let i += 1
  endfor

endfunction

vmap ,tt :call TidyUp()<CR>
