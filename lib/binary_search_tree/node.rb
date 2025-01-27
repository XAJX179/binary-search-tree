# frozen_string_literal: true

# Balanced Binary Search Tree
module BinarySearchTree
  # Node class for creating nodes for the Tree
  class Node
    attr_accessor :data, :left, :right

    def initialize(data)
      # stores value of the node
      @data = data
      # pointer to left subtree
      @left = nil
      # pointer to right subtree
      @right = nil
    end
  end
end
