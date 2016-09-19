class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response, :responder_is_not_author

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def not_duplicate_response
    unless sibling_responses.empty?
      errors[:response] << "has already been submitted by this user"
    end
  end

  def responder_is_not_author
    unless author_of_poll.id != self.user_id
      errors[:response] << "is being submitted by author of question"
    end
  end

  def sibling_responses
    self.question.total_responses.where("user_id = #{self.user_id}")
  end

  def author_of_poll
    self.question.poll.user
  end


end
