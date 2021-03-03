require "rexml/document"
require_relative "lib/question"
require_relative "lib/game"
require 'timeout'

game = Game.from_xml("#{__dir__}/data/questions.xml")

puts "Мини-викторина. Ответьте на вопросы.\n\n"

game.questions.each do |question|
  puts question

  puts "Варианты ответа:"

  question.variants.each.with_index(1) { |variant, index| puts "#{index}. #{variant}" }

  user_answer = nil

  begin
    Timeout::timeout(question.time) do
      user_answer = STDIN.gets.to_i
    end
  rescue Timeout::Error
    puts "Время закончилось"

    break
  end

  if question.correct_answer?(user_answer - 1)
    puts "Ответ правильный!\n\n"

    game.score_add(question.score)
  else
    puts "Неправильно. Правильный ответ: #{question.correct_answer}\n\n"
  end
end

puts game.final_result
