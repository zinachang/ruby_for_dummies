print "enter your age:"
age = gets.chomp.to_i

if age > 18
    print "adult"
elsif age < 3
    print "baby"
else
    print "child"
end
