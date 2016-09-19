require_relative '00_tree_node'

class KnightPathFinder

  DELTA = [[2,1],
           [2,-1],
           [-2,1],
           [-2,-1],
           [1, 2],
           [1,-2],
           [-1,2],
           [-1,-2]]

  def initialize(start_pos)
    @start_pos = start_pos
    @start_node = PolyTreeNode.new(start_pos)
    @visited_positions = [start_pos]
    @move_tree = build_move_tree
  end

  def build_move_tree
    queue = [@start_node]
    move_tree_nodes = []

    until queue.empty?
      viewed_node = queue.shift
      move_tree_nodes << viewed_node
      
      new_move_positions(viewed_node.pos).each do |pos|
        new_node = PolyTreeNode.new(pos)
        queue << new_node
        move_tree_nodes << new_node
        new_node.parent = viewed_node
      end
      
    end
    
    move_tree_nodes
  end

  def find_path(end_pos)
    queue = [@start_node]
    finish_node = nil

    until queue.empty?
      viewed_node = queue.shift
      if viewed_node.pos == end_pos
        finish_node = viewed_node
        break
      end

      viewed_node.children.each { |child| queue << child }
    end

    path = trace_path_back(finish_node)
    
    puts path.map { |y,x| "[#{y},#{x}]" }.join(" => ")
  end

  def trace_path_back(node)
    return [node.pos] if node.parent.nil?
    path = [node.pos]

    path = (trace_path_back(node.parent)) + path
  end

  def new_move_positions(pos)
    new_positions = valid_moves(pos)

    new_positions.each do |new_pos|
      if @visited_positions.include?(new_pos)
        new_positions.delete(new_pos)
      else
        @visited_positions << new_pos
      end
    end

    new_positions
  end

  def valid_moves(pos)
    valid_moves = []
    y, x = pos

    DELTA.each do |d_y, d_x|
      valid_move = [d_y + y, d_x + x]
      new_y, new_x = valid_move
      next unless new_y.between?(0,7) && new_x.between?(0,7)
      next if @visited_positions.include?(valid_move)
      valid_moves << valid_move
    end

    valid_moves
  end
end


puts "What is the start position?"
start_gets = gets.chomp
start_pos = []
start_pos << start_gets[0].to_i
start_pos << start_gets[1].to_i

puts "What is the finish position?"
finish_gets = gets.chomp
finish_pos = []
finish_pos << finish_gets[0].to_i
finish_pos << finish_gets[1].to_i

round = KnightPathFinder.new(start_pos)
round.find_path(finish_pos)