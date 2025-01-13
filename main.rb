# frozen_string_literal: true

require 'debug'
require_relative 'lib/binary_search_tree'
binding.break

arr = [7, 7, 6, 5, 4, 3, 2, 1, 1]

bst = BinarySearchTree.new(arr)

bst.to_s

bst.insert(8)
bst.insert(8)

bst.insert(9)
bst.insert(10)

puts bst.find(9)
puts bst.root.right.right.right.right

bst.to_s

x = bst.level_order_recur { |node| p node.data * 10 }

pp x

y = bst.level_order_recur

pp y

bst.to_s

x = bst.preorder { |node| p node.data * 10 }

pp x

y = bst.preorder

pp y

bst.to_s

x = bst.inorder { |node| p node.data * 10 }

pp x

y = bst.inorder

pp y

bst.to_s

x = bst.postorder { |node| p node.data * 10 }

pp x

y = bst.postorder

pp y
