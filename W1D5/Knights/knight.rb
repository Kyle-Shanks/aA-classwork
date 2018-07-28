require_relative '../PolyTreeNode/lib/00_tree_node.rb'
require 'byebug'

class Knight

  attr_accessor :visited_positions, :root

  MOVES = [
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1],
    [-1, 2],
    [-1, -2],
    [-2, 1],
    [-2, -1]
  ]

  def initialize (start_pos = [0, 0])
    @root = PolyTreeNode.new(start_pos)
    @visited_positions = []
  end

  def new_move_positions(pos)
    moves = Knight.valid_moves(pos)
    new_moves = moves.reject do |position|
      visited_positions.include?(position) || !Knight.valid_pos?(position)
    end

    @visited_positions += new_moves
    return new_moves
  end

  def build_move_tree
    queue = [@root]

    until queue.empty?
      # debugger
      node = queue.shift
      moves = new_move_positions(node.value)
      moves.each do |pos|
        new_node = PolyTreeNode.new(pos)
        node.add_child(new_node)
        queue << new_node
      end
    end
    @root
  end

  def find_path(target_pos)
    return nil unless Knight.valid_pos?(target_pos)
    build_move_tree
    node = root.bfs(target_pos)
    trace_path_back(node)
  end

  def trace_path_back(node)
    path = []
    until node.parent.nil?
      path.unshift(node.value)
      node = node.parent
    end
    [node.value] + path
  end


  private

  def self.valid_moves(pos)
    possible_moves = []

    MOVES.each do |arr|
      possible_moves << pos.map.with_index {|el, i| el + arr[i]}
    end
    possible_moves
  end

  def self.valid_pos?(pos)
    pos.all? { |el| el.between?(0,7) }
  end
end
