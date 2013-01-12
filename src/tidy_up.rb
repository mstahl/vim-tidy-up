Dir[File.join(File.dirname(__FILE__), 'tidy_up', '*.rb')].each{|f|
  require f
}

module TidyUp
end
