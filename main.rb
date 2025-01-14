# frozen_string_literal: true

# require 'debug'
require_relative 'lib/binary_search_tree'
# binding.break

# arr = [7, 7, 6, 5, 4, 3, 2, 1, 1]
#
# bst = BinarySearchTree.new(arr)
#
# bst.to_s
#
# bst.insert(8)
# bst.insert(8)
#
# bst.insert(9)
# bst.insert(10)
#
# puts bst.find(9)
# puts bst.root.right.right.right.right
#
# bst.to_s
#
# x = bst.level_order_recur { |node| p node.data * 10 }
#
# pp x
#
# y = bst.level_order_recur
#
# pp y
#
# bst.to_s
#
# x = bst.preorder { |node| p node.data * 10 }
#
# pp x
#
# y = bst.preorder
#
# pp y
#
# bst.to_s
#
# x = bst.inorder { |node| p node.data * 10 }
#
# pp x
#
# y = bst.inorder
#
# pp y
#
# bst.to_s
#
# x = bst.postorder { |node| p node.data * 10 }
#
# pp x
#
# y = bst.postorder
#
# pp y
#
# bst.to_s
#
# pp bst.height
#
# bst.delete(8)
#
# bst.delete(7)
#
# bst.to_s
#
# pp bst.height
#
# bst.to_s
#
# bst.insert(11)
#
# bst.to_s
#
# pp bst.depth(bst.find(9))
#
# pp bst.balanced?
#
# bst.delete(11)
#
#
# bst.to_s
#
# pp bst.balanced?
# pp 'end'
arr = (Array.new(15) { rand(1..100) })
bst = BinarySearchTree.new(arr)

bst.to_s

pp bst.balanced?

pp 'preorder'

bst.preorder { |node| p node.data }

bst.to_s

pp 'inorder'

bst.inorder { |node| p node.data }

bst.to_s

pp 'postorder'

bst.postorder { |node| p node.data }

pp 'insert random > 100'
bst.insert(110)
bst.insert(120)
bst.insert(130)
bst.insert(140)
bst.insert(150)

bst.to_s

pp 'balanced?'

pp bst.balanced?

pp 'rebalance'

bst.rebalance

bst.to_s

pp 'balanced?'

pp bst.balanced?

pp 'preorder'

bst.preorder { |node| p node.data }

bst.to_s

pp 'inorder'

bst.inorder { |node| p node.data }

bst.to_s

pp 'postorder'

bst.postorder { |node| p node.data }
