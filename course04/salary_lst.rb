# encoding: utf-8
require 'roo'
require 'awesome_print'
require 'pry'
require 'action_view'
include ActionView::Helpers

#read the excel filename
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
  len = (lo_to_hi.count-1)
  sum + lo_to_hi[ len-i ].last
end
ap("top #{one_tenth} sum:#{(sum)}, average #{sum/one_tenth}")