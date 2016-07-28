class Users < ModelBase
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    super('users', id)
  end

  def self.all
    super('users')
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    users.map { |user| Users.new(user) }
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_author_id(self.id)
  end

  def liked_quesitons
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    avg_karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST( COUNT (question_likes.user_id)  AS FLOAT) / COUNT( DISTINCT questions.id) AS avg_karma
      FROM
        questions
        LEFT OUTER JOIN question_likes
        ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?
    SQL
    avg_karma.first.values.first
  end

  def save
    if @id.nil?
      super('users')
    #   QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
    #   INSERT INTO
    #     users (fname, lname)
    #   VALUES
    #     (?, ?)
    # SQL
    # @id = QuestionsDatabase.instance.last_insert_row_id
    # else
    #   update
    else
      update
    end
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
    UPDATE
      users
    SET
      fname = ?, lname = ?
    WHERE
      id = ?
  SQL
  end

end
