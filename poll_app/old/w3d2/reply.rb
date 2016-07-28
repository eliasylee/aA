require 'byebug'

class Reply < ModelBase
  attr_accessor :id, :question_id, :user_id, :parent_reply, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_reply = options['parent_reply']
    @body = options['body']
  end

  def self.find_by_id(id)
    super('replies', id)
  end

  def self.all
    super('replies')
  end


  def self.find_by_user_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def author
    Users.find_by_author_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Users.find_by_author_id(@parent_reply)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def save
    debugger
    if @id.nil?
      super('replies')
    else
      update
    end
  end

  # def save
  #   if @id.nil?
  #     QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_reply, @user_id, @body)
  #     INSERT INTO
  #       replies (question_id, parent_reply, user_id, body)
  #     VALUES
  #       (?, ?, ?, ?)
  #   SQL
  #   @id = QuestionsDatabase.instance.last_insert_row_id
  #
  #   else
  #     update
  #   end
  # end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_reply, @user_id, @body, @id)
    UPDATE
      replies (question_id, parent_reply, user_id, body)
    SET
      question_id = ?, parent_reply = ?, user_id = ?, body = ?

    WHERE
      id = ?
    SQL
  end

end
