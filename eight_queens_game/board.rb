class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, "_") }
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
    @board
  end

  def open_positions?
    open_positions = []
    @grid.each_with_index do |row, r_i|
      row.each_with_index do |ele, c_i|
        open_positions << [r_i, c_i] if ele == "_"
      end
    end
    open_positions
  end

  def place_queen(pos)
    x, y = pos
    @grid[x][y] = "Q"
  end

  def remove_positions(pos)
    remove_columns(pos)
    remove_rows(pos)
    remove_diagonals(pos)
  end

  def remove_columns(pos)
    x, y = pos

    @grid.each_with_index do |row, r_i|
      row.each_with_index do |col, c_i|
        if c_i == y
          @grid[r_i][c_i] = "X" unless @grid[r_i][c_i] == "Q"
        end
      end
    end
  end

  def remove_rows(pos)
    x, y = pos

    @grid.each_with_index do |row, i|
      if i == x
        (0..7).each do |col|
          unless @grid[i][col] == "Q"
            @grid[i][col] = "X"
          end
        end
      end
    end
  end

  def remove_diagonals(pos)
    x, y = pos

    @grid.each_with_index do |row, row_i|
      row.each_with_index do |el, col_i|
        if (row_i - x) == (col_i - y) || (row_i - x) == -(col_i - y)
          unless @grid[row_i][col_i] == "Q"
            @grid[row_i][col_i] = "X"
          end
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x.to_i][y.to_i]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x.to_i][y.to_i] = value
  end
end