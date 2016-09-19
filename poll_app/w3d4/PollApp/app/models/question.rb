class Question < ActiveRecord::Base
  validates :poll_id, presence: true, uniqueness: true
  validates :text, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :total_responses,
    through: :answer_choices,
    source: :responses

  # the good old boys >>
  # def results
  #   ac_arr = self.answer_choices
  #   response_count = Hash.new(0)
  #   ac_arr.each do |ac|
  #     response_count[ac.text] += ac.responses.count
  #   end
  #   response_count
  # end
  #
  # def better_results
  #   ac_arr = self.answer_choices.includes(:responses)
  #   response_count = Hash.new(0)
  #   ac_arr.each do |ac|
  #     response_count[ac.text] += ac.responses.count
  #   end
  #   response_count
  # end

  def results
    relation = self.answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS response_count")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.id")

    relation.inject({}) {|results, ac| results[ac.text] = ac.response_count; results }
  end

end
