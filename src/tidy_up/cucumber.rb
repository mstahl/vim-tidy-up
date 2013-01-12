module TidyUp
  module Cucumber
    def self.tablify(string)
      indent = ' ' * string.lines.to_a.last.gsub(/^(\s+).*/, '\1').length
      table = []
      string.strip.lines.each do |line|
        line.strip!.gsub!(/^\||\|$/, '')
        columns = line.split(/\s*\|\s*/)
        table << columns
      end

      column_widths = nil

      table.each do |row|
        column_widths ||= [0] * row.count
        column_widths = row.zip(column_widths).map do |column, width|
          [width, column.length].max
        end
      end

      table.map{|row|
        indent + "|" + row.zip(column_widths).map{|col, width|
          " %-0#{width}s " % col
        }.join("|") + "|"
      }.join("\n")
    end
  end
end
