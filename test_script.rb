require_relative('tree.rb')

puts 'Creating a tree from an array of random integers...'
tree = Tree.new(Array.new(15) { rand(1..100) })
puts 'Look, a balanced tree!'
tree.pretty_print
puts 'But is my tree balanced? True or false:'
puts tree.balanced?
puts "Traversing (or shall we say treeversing) level order: #{tree.level_order}"
puts "Traversing level order, this time using recursion: #{tree.level_order_rec}"
puts "Traversing inorder: #{tree.inorder}"
puts "Traversing preorder: #{tree.preorder}"
puts "Traversing postorder: #{tree.postorder}"
puts "Let's add a few nodes... 182, 101 and 104."
tree.insert(182)
tree.insert(101)
tree.insert(104)
puts 'Is my tree balanced after adding nodes? True or false:'
puts tree.balanced?
puts 'Okay, rebalancing.'
tree.rebalance
puts 'Now is my tree balanced? True or false:'
puts tree.balanced?
puts "Let's do a few more traversals:"
puts "level order: #{tree.level_order}"
puts "level order rec: #{tree.level_order_rec}"
puts "inorder: #{tree.inorder}"
puts "preorder: #{tree.preorder}"
puts "postorder: #{tree.postorder}"
puts 'And one more pretty tree for the road!'
tree.pretty_print
