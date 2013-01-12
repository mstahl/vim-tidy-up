if exists("g:loaded_tidy_up")
  finish
end

if !has("ruby") || version < 700
  echon "Sorry. Tidy Up requires Ruby."
end

ruby << EOF
require File.join(File.dirname(__FILE__), 'src', 'tidy_up.rb')
EOF
