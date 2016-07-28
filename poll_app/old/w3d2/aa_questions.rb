require 'sqlite3'
require 'singleton'
require_relative 'question'
require_relative 'reply'
require_relative 'users'
require_relative 'questionlike'
require_relative 'questionfollow'
require_relative 'modelbase'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
