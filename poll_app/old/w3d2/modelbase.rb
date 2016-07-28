require 'byebug'

class ModelBase
  def self.find_by_id(table, id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL

    questions.map { |quesiton| self.new(quesiton) }
  end

  def self.all(table)
    requests = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      #{table}
    SQL
    requests.map { |request| self.new(request)}
  end

  def save(table)
    count = self.instance_variables.count - 1
    q_marks = []
    str = self.instance_variables[1..-1].map! {|name| name[1..-1] }.join(", ")
    count.times do
        q_marks << '?'
      end
    q_marks = q_marks.join(",")
      # byebug
      QuestionsDatabase.instance.execute(<<-SQL, *self.instance_variables[1..-1].map!(&:to_s))
      INSERT INTO
        #{table} (#{str})
      VALUES
      (#{q_marks})
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  # def update(table)
  #   count = self.instance_variables.count - 1
  #   q_marks = []
  #   str = self.instance_variables[1..-1].map! {|name| name[1..-1] }.join(", ")
  #   count.times do
  #       q_marks << '?'
  #     end
  #   q_marks = q_marks.join(",")
  #   QuestionsDatabase.instance.execute(<<-SQL, *self.instance_variables.rotate!.map!(&:to_s))
  #   UPDATE
  #     #{table} (#{str})
  #   SET
  #     (#{q_marks})
  #
  #   WHERE
  #     id = ?
  #     SQL
  #
  # end

end
