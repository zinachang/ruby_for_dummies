# encoding: utf-8
require 'roo'
require 'awesome_print'
require 'pry'
require 'action_view'
include ActionView::Helpers

excel_filename= ARGV[0]
#read Excel
input = Roo::Excel.new(excel_filename)
salary_lst = []
output = Array.new
summary = Hash.new
input.default_sheet = input.sheets[0]

(input.first_row+1).upto(input.last_row) do |line_no|
  this_row = input.row(line_no)
  name = this_row[1].downcase + " " + this_row[2].downcase
  summary[name] = [this_row.first] + this_row[4..-1]
end

while c = $stdin.gets.downcase.chomp and c != 'q'
  next if 0 == c.strip.length   
  result = summary.keys.grep(/#{c}/)
  ap("Total: #{result.count}")
  result.each do |key|
    p key
    ap([summary[key].first, summary[key].last])
  end
end
p "bye~bye~"