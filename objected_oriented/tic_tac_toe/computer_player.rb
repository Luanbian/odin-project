# frozen_string_literal: true

class ComputerPlayer < Player
  def group_positions_by_markers(line)
    markers = line.group_by {|position| @game.board[position]}
    markers.default = []
    markers
  end

  def select_position!
    opponent_marker = @game.opponent.marker
    winning_or_blocking_position = look_for_winning_or_blocking_position(opponent_marker)
    return winning_or_blocking_position if winning_or_blocking_position

    if corner_trap_defense_needed?
      return corner_trap_defense_position(opponent_marker)
    end

    random_prioritized_position
  end

  def look_for_winning_or_blocking_position(opponent_marker)
    LINES.each { |line|
      markers = group_positions_by_markers(line)
      next if markers[nil].length != 1
      if markers[self.marker].length == 2
        return markers[nil].first
      elsif markers[opponent_marker].length == 2
        return markers[nil].first
      end
    }
  end

  def corner_trap_defense_needed?
    corner_positions = [1, 3, 7, 9]
    opponent_chose_a_corner = corner_positions.any?{|pos| @game.board[pos] != nil}
    @game.turn_num == 2 && opponent_chose_a_corner
  end

  def corner_trap_defense_position(opponent_marker)
    opponent_position = @game.board.find_index {|marker| marker == opponent_marker}
    safe_responses = {1=>[2,4], 3=>[2,6], 7=>[4,8], 9=>[6,8]}
    safe_responses[opponent_position].sample
  end

  def random_prioritized_position
    ([5] + [1,3,7,9].shuffle + [2,4,6,8].shuffle).find do |pos|
      @game.free_positions.include?(pos)
    end
  end

  def to_s
    "Computer#{@game.current_player_id}"
  end
end
