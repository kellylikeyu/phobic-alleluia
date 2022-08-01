class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner

    n = @board.length
    
    # all combinations from matrix rows
    rows = @board
    # all combinations from matrix columns, columns are transposed from board matrix
    cols = @board.transpose
    # there are two combinations of diagonal result, using index to represent: back diagonal element is
    # matrix[i][i], forward diagonal element is matrix[i][length-1-i] 
    dia_backward = Array.new
    dia_forward = Array.new
    for index in 0...n
      dia_backward.push(@board[index][index])
      dia_forward.push(@board[index][n-index-1])
    end

    # get all combinations 
    combinations = rows + cols + [dia_backward] + [dia_forward]
  
    # for each combination, determine if there is a winner, and who is the winner
    for combination in combinations
      # in the combination array, determine if all elements are "o", if yes, the winner is "o"
      if combination.all? {|try| try == "o"} 
        return "o"
      # in the combination array, determine if all elements are "x", if yes, the winner is "x"
      elsif combination.all? {|try| try == "x"}
        return "x"  
      end
    end

    # if there is no winner, the game is unfinished or draw
    # using an array to represent all tries from the board matrix
    # if there is any empty try (" "), the game is unfinished, otherwise the game is draw
    all_try = Array.new
    for row in 0...n
      all_try += @board[row]
    end
    if all_try.any? {|try| try == " "} 
        return "unfinished"
      else
        return "draw"
    end

  end
end
