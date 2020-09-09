require_relative('tree.rb')

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print
puts tree.balanced?
puts "level order: #{tree.level_order}"
puts "level order rec: #{tree.level_order_rec}"
puts "inorder: #{tree.inorder}"
puts "preorder: #{tree.preorder}"
puts "postorder: #{tree.postorder}"
tree.insert(182)
tree.insert(101)
tree.insert(104)
puts tree.balanced?
tree.rebalance
puts tree.balanced?
puts "level order: #{tree.level_order}"
puts "level order rec: #{tree.level_order_rec}"
puts "inorder: #{tree.inorder}"
puts "preorder: #{tree.preorder}"
puts "postorder: #{tree.postorder}"
tree.pretty_print
