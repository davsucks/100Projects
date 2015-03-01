# **Find Cost of Tile to Cover W x H Floor** - Calculate the total cost of
# tile it would take to cover a floor plan of width and height, using a cost
# entered by the user.

print "Please tell me how much each square foot of tile costs: $"
tile_cost = gets.chomp.to_f

print "How about the width: "
width = gets.chomp.to_f
print "Height: "
height = gets.chomp.to_f

puts "Your total cost = $#{ width * height * tile_cost }"