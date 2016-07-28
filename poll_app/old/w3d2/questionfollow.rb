
class QuestionFollow < ModelBase
  attr_accessor :id, :quesiton_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.followers_for_question_id(question_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
        JOIN
          users ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?

    SQL

    follows.map { |follow| Users.new(follow) }
  end

  def self.all
    super('question_follows')
  end

  def self.followed_questions_for_user_id(user_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
        JOIN
          questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?

    SQL

    follows.map { |follow| Question.new(follow) }
  end

  def self.find_by_id(id)
    super('question_follows', id)
  end

  def self.most_followed_questions(n)
    follows = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
        JOIN questions
          ON questions.id = question_follows.question_id
        GROUP BY
          question_id
        ORDER BY
          COUNT(*) DESC
        LIMIT ?
    SQL

    follows.map { |follow| Question.new(follow) }

  end
end
