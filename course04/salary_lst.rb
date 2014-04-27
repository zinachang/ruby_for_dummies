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
  salary_lst << this_row
  summary[this_row[1, 2].map(&:downcase).join(' ')] = [this_row.first] + this_row[4..-1]
end

lo_to_hi = salary_lst.sort_by{|k|k.last}
hi_to_lo = lo_to_hi.reverse

one_tenth, one_fifth = lo_to_hi.count/10, lo_to_hi.count/5

sum = 0
0.upto(one_fifth-1) do |line_no|
  sum += lo_to_hi[line_no].last
end
ap("bottom #{one_fifth} sum:#{sum}, average #{sum/one_fifth}")

sum = 0.upto(one_tenth-1).inject(0) do |sum,i|
  sum + lo_to_hi[ (lo_to_hi.count-1) -i ].last
end

ap("top #{one_tenth} sum:#{(sum)}, average #{sum/one_tenth}")

while c = $stdin.gets.downcase.chomp and c != 'q'
  next if 0 == c.strip.length 
  
  result = summary.keys.grep(/#{c}/)
  ap("Total: #{result.count}")
  result.each do |key|
    p key
    ap([summary[key].first, summary[key].last])
  end
end