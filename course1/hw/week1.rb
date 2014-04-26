def temp_convert(input_temp)
    answer = input_temp*(9/5.0)+32
    return "Your answer is " + answer.to_s    
    # return "Your answer is #{answer} "   
end
puts "please enter Celsius:"
c = gets.chomp
puts temp_convert(c.to_i)

