# frozen_string_literal: true

# Balanced Binary Search Tree
module BinarySearchTree
  # Helps tree methods
  module Helpers
    # finds successor node (the node right next to current node in ascending order)
    def find_successor(node)
      return nil if node.nil?

      node = node.right
      node = node.left until node.left.nil?
      node
    end

    # handles child nodes for delete operation
    def handle_child(curr_node)
      return curr_node.right if curr_node.left.nil?
      return curr_node.left if curr_node.right.nil?

      successor = find_successor(curr_node)
      curr_node.data = successor.data
      curr_node.right = delete(successor.data, curr_node.right)
      curr_node
    end

    # appends childs to queue for level_order traversal (BFS)
    def append_child_to_queue(queue, current)
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end

    # pretty print
    def to_s(node = @root, prefix = '', is_left = true)
      to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    # recursive approach to level_order
    def level_order_recur(queue = [@root], result = [], &block)
      return nil if @root.nil? || queue.empty?

      result << current = queue.shift

      yield(current) if block_given?

      append_child_to_queue(queue, current)

      level_order_recur(queue, result, &block)

      result if queue.empty? && !block_given?
    end

    # for given node check if height of left and right subtree <= 1
    def balanced_height?(node)
      left = height(node.left)
      right = height(node.right)

      diff = (left - right).abs
      diff <= 1
    end
  end
end
