# frozen_string_literal: true
require_relative 'game'
require_relative 'player'
require_relative 'computer_player'
require_relative 'human_player'
class Main
  def initialize
    Game.new(HumanPlayer, ComputerPlayer).play
  end
end

Main.new