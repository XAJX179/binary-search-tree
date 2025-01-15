# frozen_string_literal: true

require_relative 'helpers/helpers'

# Balanced Binary Search Tree
module BinarySearchTree
  # Tree Class for creating binary search trees
  class Tree # rubocop:disable Metrics/ClassLength
    def initialize(arr)
      @root = build_tree(arr)
    end

    include Helpers

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

    # inserts a leaf (unbalances the tree)
    def insert(val, curr_node = @root)
      return Node.new(val) if curr_node.nil?
      return curr_node if curr_node.data == val # no duplicates

      if val < curr_node.data # if val is smaller go left
        curr_node.left = insert(val, curr_node.left)
      else # if val is bigger go right
        curr_node.right = insert(val, curr_node.right)
      end

      curr_node
    end

    # delete node of tree matching the given value
    def delete(val, curr_node = @root)
      return nil if curr_node.nil?

      if val < curr_node.data
        curr_node.left = delete(val, curr_node.left)
      elsif val > curr_node.data
        curr_node.right = delete(val, curr_node.right)
      else
        return handle_child(curr_node)
      end
      curr_node
    end

    # find node with given value
    def find(val, curr_node = @root)
      return nil if curr_node.nil?

      if val < curr_node.data
        find(val, curr_node.left)
      elsif val > curr_node.data
        find(val, curr_node.right)
      else
        curr_node
      end
    end

    # level_order traversal (BFS)
    def level_order
      return nil if @root.nil?

      queue = [@root]
      result = []

      until queue.empty?
        result << current = queue.shift
        yield(current) if block_given?
        append_child_to_queue(queue, current)
      end
      result unless block_given?
    end

    # DFS methods - DLR,LDR,LRD

    def preorder(node = @root, result = [], &block)
      return nil if node.nil?

      result << node

      yield(node) if block_given?
      preorder(node.left, result, &block)
      preorder(node.right, result, &block)

      result unless block_given?
    end

    def inorder(node = @root, result = [], &block)
      return nil if node.nil?

      result << node

      inorder(node.left, result, &block)
      yield(node) if block_given?
      inorder(node.right, result, &block)

      result unless block_given?
    end

    def postorder(node = @root, result = [], &block)
      return nil if node.nil?

      result << node

      postorder(node.left, result, &block)
      postorder(node.right, result, &block)
      yield(node) if block_given?

      result unless block_given?
    end

    # find height of given node (node to tail longest distance)
    def height(node = @root, val = -1)
      return val if node.nil?

      val += 1
      left_val = height(node.left, val)
      right_val = height(node.right, val)

      [left_val, right_val].max
    end

    # find depth of node (distance from root to node)
    def depth(target_node, val = 0, current_node = @root)
      return val if target_node == current_node
      return 0 if current_node.nil?

      val += 1

      left = depth(target_node, val, current_node.left)

      return left if left.positive?

      depth(target_node, val, current_node.right)
    end

    # checks if tree is balanced
    def balanced?(node = @root)
      return true if node.nil?

      bool = balanced_height?(node)
      return false unless bool

      balanced?(node.left) && balanced?(node.right)
    end

    # rebalances the tree
    def rebalance
      result = inorder(@root).map(&:data)
      @root = build_tree(result)
    end
  end
end
