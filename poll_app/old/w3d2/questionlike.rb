
class QuestionLike < ModelBase
  attr_accessor :id, :quesiton_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    super('question_likes', id)
  end

  def self.all
    super('question_likes')
  end

  def self.likers_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        user_id
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    likes.map { |like| Users.new(like) }
  end

  def self.num_likes_for_question_id(question_idd)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_idd)
      SELECT
        COUNT(user_id)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    likes.first.values.first
  end

  def self.liked_questions_for_user_id(user_idd)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_idd)
      SELECT
        questions.*
      FROM
        question_likes
        JOIN
          questions ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL

    likes.map { |likes| Question.new(likes) }
  end

  def self.most_liked_questions(n)
    likes = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_likes
        JOIN questions
          ON questions.id = question_likes.question_id
        GROUP BY
          question_id
        ORDER BY
          COUNT(*) DESC
        LIMIT ?
    SQL

    likes.map { |like| Question.new(like) }

  end

end
