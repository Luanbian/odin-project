# frozen_string_literal: true

class Player
  attr_reader :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end

  def select_position!
    raise NotImplementedError, 'Subclasses must implement select_position!'
  end
end
