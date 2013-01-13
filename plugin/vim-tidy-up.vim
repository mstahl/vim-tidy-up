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
  echo table
  echo column_widths

  for row in table
    echo(row[0] + '| ' + join(row[1:-1], ' | ') + ' |')
  endfor

endfunction

command TidyUp :call TidyUp()
vmap ,tt :call TidyUp()<CR>

ruby <<EOF

require File.join(File.dirname(__FILE__), '..', 'src', 'tidy_up.rb')

def tidy_up(tbl)
  TidyUp::Cucumber.tablify(tbl)
end

EOF
