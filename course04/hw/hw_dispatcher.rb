require 'awesome_print'
require 'pry'
students = %w[Stephanie Mike Beginner Zina]
workers = {}
students.each do |student|
  workers[student.to_sym]=[]
end


open("array.txt").each_with_index do | item, idx|
  # p x.strip, idx
  key = students[(idx % students.count)].to_sym
  workers[key] << item.strip.to_sym  
end

output_file = open("assignment.txt",'w')

workers.keys.each do |key|
  ap(key)
  output_file.write("="*49)
  output_file.write("\n#{key}\n")
  output_file.write("="*49 + "\n")

  workers[key].each do |item|
    output_file.write("#{item}\n")
  end
end
