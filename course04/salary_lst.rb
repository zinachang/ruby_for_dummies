# encoding: utf-8
require 'roo'
require 'awesome_print'
require 'fileutils'
require 'pry'

excel_filename= ARGV[0]
input = Roo::Excel.new(excel_filename)
salary_lst = []

output = Array.new
summary = Hash.new
input.default_sheet = input.sheets[0]


(input.first_row+1).upto(input.last_row) do |line_no|
  salary_lst << input.row(line_no)
end

lo_to_hi = salary_lst.sort_by{|k|k.last}

high_to_low_salary = salary_lst
                     .sort_by{|k|k.last}
                     .reverse
n_lines = (input.last_row - input.first_row + 1).to_i
one_tenth = (n_lines) / 10
one_fifth = (n_lines) / 5

sum = 0
0.upto(one_fifth-1) do |line_no|
  sum += lo_to_hi[line_no].last
end
ap("bottom #{one_fifth} sum:#{sum}, average #{sum/one_fifth}")

sum = 0
0.upto(one_tenth-1) do |line_no|
  # begin
    sum += lo_to_hi[lo_to_hi.count-line_no].last
  # rescue Exception => e
  #   ap(lo_to_hi.first)  
  #   ap(lo_to_hi.last)  
  #   ap(lo_to_hi[high_to_low_salary.count-line_no])  
  # end
end
ap("top #{one_tenth} sum:#{sum}, average #{sum/one_tenth}")
