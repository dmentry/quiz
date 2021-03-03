class Game
  attr_reader :player_corr_answers, :player_score, :questions

  QUESTIONS_COUNT = 5

  def initialize(questions)
    @player_corr_answers = 0
    @player_score = 0
    @questions = questions.sample(QUESTIONS_COUNT)
  end

  def self.from_xml(file_path)
    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close

    questions = doc
      .get_elements("questions/question")
        .map { |xml| Question.from_xml(xml) }
    new(questions)
  end

  def score_add(question_score)
    @player_corr_answers += 1
    @player_score += question_score
  end

  def final_result
    <<~MESSAGE
      Правильных ответов: #{@player_corr_answers} из #{QUESTIONS_COUNT}.
      Вы набрали #{@player_score} баллов.
    MESSAGE
  end
end
