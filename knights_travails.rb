load "./treenode.rb"
require "Set"
class KnightPathFinder
  attr_reader :board, :root
  def initialize(start_pos, x_dim = 8, y_dim = 8)
    @board = build_board(x_dim,y_dim)
    @root = find_start(start_pos)
    build_move_tree
  end

  def find_path(target_pos)
    @root.bfs(target_pos).path
  end

  private

    def build_board(x_dim=8, y_dim=8)
      board =[]
      y_dim.times do |y_coor|
        x_dim.times do |x_coor|
          board << TreeNode.new([x_coor, y_coor])
        end
      end
      board
    end

    def build_move_tree()
      queue = [@root]
      visited_positions = Set.new [@root]

      until queue.empty?
        current_square = queue.shift
        possible_destinations = new_move_positions(current_square.value)
        possible_destinations.each do |destination|
          unless visited_positions.include?(destination)
            visited_positions << destination
            queue << destination
            current_square.add_child(destination)
          end
        end
      end
      nil
    end

    def new_move_positions(pos)
      x_pos, y_pos = pos
      possible_distances = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
      valid_squares = []
      possible_distances.each do |offset|
        new_pos = [x_pos + offset[0], y_pos + offset[1]]
        @board.each do |square|
          valid_squares << square if square.value == new_pos
        end
      end
      valid_squares
    end

    def find_start(start_pos)
      @board.each do |square|
        return square if square.value == start_pos
      end
      raise ("Starting position not on board")
    end


end
