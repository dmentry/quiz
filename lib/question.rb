class Question
  attr_reader :question_text, :correct_answer, :score, :variants, :time

  def initialize(params)
    @question_text = params[:question_text]
    @correct_answer = params[:correct_answer]
    @score = params[:score]
    @variants = params[:variants]
    @time = params[:time]
  end

  def self.from_xml(xml)
    question_text = xml.elements["text"].text
    answers_xml = xml.get_elements("variants/variant")
    variants = answers_xml.map { |variants| variants.text }
    correct_answer = answers_xml.find { |xml| xml.attributes["right"] }.text
    score = xml.attributes["points"].to_i
    time = xml.attributes["seconds"].to_i

    new(
      question_text: question_text,
      correct_answer: correct_answer,
      score: score,
      variants: variants.shuffle!,
      time: time
    )
  end

  def correct_answer?(answer_index)
    @variants[answer_index] == @correct_answer
  end

  def to_s
    "#{@question_text} (#{@score} баллов), время #{@time} сек."
  end
end
