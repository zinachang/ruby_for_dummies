# encoding: utf-8
require 'awesome_print'
require 'pry'

attendees_lst =[
  [:Mike, 500],
  [:Zina, 300],
]
attendees_lst.each do | data |
  if data[0]== :Mike
    p data
  end
end

#find mike salary 
