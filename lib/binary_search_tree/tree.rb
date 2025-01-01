# frozen_string_literal: true

# Balanced Binary Search Tree
module BinarySearchTree
  # Tree Class for creating binary search trees
  class Tree
    def initialize(arr)
      @root = build_tree(arr)
    end

    # builds a balanced binary tree
    def build_tree(arr)
      new_arr = arr.sort.uniq
      build_tree_recur(new_arr, 0, new_arr.length - 1)
    end

    # takes array and start and ending of arr range and builds bst recursively
    def build_tree_recur(new_arr, start, ending)
      return nil if start > ending

      mid = (start + ending) / 2
      root = Node.new new_arr[mid]

      root.left = build_tree_recur(new_arr, start, mid - 1)
      root.right = build_tree_recur(new_arr, mid + 1, ending)
      root
    end

    # pretty print
    def to_s(node = @root, prefix = '', is_left = true)
      to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
  end
end
