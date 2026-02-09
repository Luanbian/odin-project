# frozen_string_literal: true

class Hangman
  attr_reader :secret_word, :is_finished
  attr_accessor :chances, :player_response

  def initialize
    path = File.join(__dir__, 'random_words.txt')
    unless File.exist?(path)
      warn "Arquino #{path} não encontrado."
      exit 1
    end

    words = File.readlines(path, chomp: true).select { |word| word.length.between?(5, 8) }
    @secret_word = words.sample
    @player_response = Array.new(@secret_word.length, ' _ ')
    @chances = 7
    @is_finished = false
  end

  def draw_placeholder
    puts @secret_word
    puts "A palavra tem #{@secret_word.length} letras"
    puts "Você tem #{chances} chances"
    puts @player_response.join(' ')
  end

  def update_placeholder(guess)
    @secret_word.each_char.with_index do |char, index|
      @player_response[index] = char if char.eql?(guess)
    end

    puts @player_response.join(' ')

    return if @player_response.any?(' _ ')

    @is_finished = true
  end

  def decrease_chance
    puts 'Não tem essa letra, menos uma chance'
    @chances -= 1
    puts "restam #{@chances} chances"
  end

  def play
    draw_placeholder

    while @chances > 0 && !@is_finished
      guess = get_player_guess
      if @secret_word.include?(guess)
        update_placeholder(guess)
      else
        decrease_chance
      end
    end

    puts "Acabaram suas chances, a resposta era #{@secret_word}" if @chances <= 0
    puts 'UAU, acertou a palavra na mosca!' if @is_finished
    puts "voce ganhou #{calculate_points} pontos"
  end

  def get_player_guess
    loop do
      print 'Select your guess: '
      guess = gets.chomp.downcase.to_s
      return guess unless guess.empty?
    end
  end

  def calculate_points
    case @chances
    when 7 then 100
    when 5..6 then 70
    when 2..4 then 50
    when 1 then 30
    else 0
    end
  end
end

Hangman.new.play

