class TowerGame
  attr_reader :board

  def initialize
    @board = [[3, 2, 1],[],[]]
  end

  def move_disc(from, to)
    raise "that pillar is empty!" if board[from].empty?
    unless board[to].empty? || board[from].last < board[to].last
      raise "can't move a bigger disc onto a smaller one"
    end

    board[to].push(board[from].pop)

    board
  end

  def prompt
    puts "Which pillar do you want to move a disc from?"
    print "> "
    from = gets.chomp.to_i

    puts "which pillar do you want to move a disc to?"
    print "> "
    to = gets.chomp.to_i

    [from, to]
  end

  def won?
    board == [[],[3,2,1],[]] || board == [[],[],[3,2,1]]
  end

  def run
    until won?
      p board
      from, to = prompt
      move_disc(from, to)
    end

    puts "You won!"
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowerGame.new
  game.run
end
