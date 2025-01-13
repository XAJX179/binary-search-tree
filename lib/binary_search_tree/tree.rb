# frozen_string_literal: true

# Balanced Binary Search Tree
module BinarySearchTree
  # Tree Class for creating binary search trees
  class Tree
    attr_reader :root

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

    # inserts a leaf (unbalances the tree)
    def insert(val, curr_node = @root)
      return Node.new(val) if curr_node.nil?
      return curr_node if curr_node.data == val # no duplicates

      if val < curr_node.data # if val is smaller go left
        curr_node.left = insert(val, curr_node.left)
      elsif val > curr_node.data # if val is bigger go right
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

    def find_successor(node)
      return nil if node.nil?

      node = node.right
      node = node.left until node.left.nil?
      node
    end

    def handle_child(curr_node)
      return curr_node.right if curr_node.left.nil?
      return curr_node.left if curr_node.right.nil?

      successor = find_successor(curr_node)
      curr_node.data = successor.data
      curr_node.right = delete(successor.data, curr_node.right)
      curr_node
    end

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

    def level_order_recur(queue = [@root], result = [], &block)
      return nil if @root.nil? || queue.empty?

      result << current = queue.shift

      yield(current) if block_given?

      append_child_to_queue(queue, current)

      level_order_recur(queue, result, &block)

      result if queue.empty? && !block_given?
    end

    def append_child_to_queue(queue, current)
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end

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

    def height(node = @root, val = -1)
      return val if node.nil?

      val += 1
      left_val = height(node.left, val)
      right_val = height(node.right, val)

      [left_val, right_val].max
    end
  end
end
