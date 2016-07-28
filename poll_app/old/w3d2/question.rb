

class Question < ModelBase
  attr_accessor :id, :author_id, :title, :body

  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @title = options['title']
    @body = options['body']
  end

  def self.find_by_id(id)
    super('questions', id)
  end

  def self.all
    super('questions')
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

    def self.find_by_author_id(id)
      questions = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          questions
        WHERE
          author_id = ?
      SQL

      questions.map { |quesiton| Question.new(quesiton) }
    end

    def author
      Users.find_by_id(@author_id)
    end

    def replies
      Reply.find_by_question_id(@id)
    end

    def self.most_followed(n)
      QuestionFollow.most_followed_questions(n)
    end

    def likers
      QuestionLike.likers_for_question_id(@id)
    end

    def num_likes
      QuestionLikes.num_likes_for_question_id(@id)
    end

    def self.most_liked(n)
      QuestionFollow.most_liked_questions(n)
    end

    def save
      if @id.nil?
        users = QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
        INSERT INTO
          users (title, body, author_id)
        VALUES
          (?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
      else
        update
      end
    end

    def update
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
    end

end
