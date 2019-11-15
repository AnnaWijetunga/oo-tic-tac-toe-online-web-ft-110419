require "pry"

class TicTacToe
  
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O" 
      return true 
    else
      return false 
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  # def valid_move?(index)
  #   index.between?(0,8) == false  
  #   if position_taken?(index)
  #     return false 
  #   else 
  #     return true  
  #   end 
  # end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  def current_player
  #if the turn count is an even number, that means O just went, so the next/current player is X
    num_turns = turn_count
    if num_turns % 2 == 0
      player = "X"
    else
      player = "O"
    end
    return player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end

end
