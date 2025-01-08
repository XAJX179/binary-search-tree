# frozen_string_literal: true

require 'debug'
require_relative 'lib/binary_search_tree'

arr = [7, 7, 6, 5, 4, 3, 2, 1, 1]

bst = BinarySearchTree.new(arr)

bst.to_s

bst.insert(8)
bst.insert(8)

bst.insert(9)
bst.insert(10)

bst.to_s
