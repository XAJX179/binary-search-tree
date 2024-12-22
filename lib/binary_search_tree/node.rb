# frozen_string_literal: true

# Node class for creating nodes for the Tree
class Node
  attr_accessor :data

  def initialize(data)
    # stores value of the node
    @data = data
    # pointer to left subtree
    @left = nil
    # pointer to right subtree
    @right = nil
  end
end
