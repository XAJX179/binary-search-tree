# frozen_string_literal: true

require_relative 'binary_search_tree/node'
require_relative 'binary_search_tree/tree'

# Balanced Binary Search Tree
module BinarySearchTree
  def self.new(arr)
    Tree.new(arr)
  end
end
