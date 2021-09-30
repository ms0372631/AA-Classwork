require 'sqlite3'
require_relative 'question_db'

class Questions
  attr_reader :author_id, :body

    def self.all
       data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
       data.map { |datum| Questions.new(datum) }
    end

    def self.find_by_id(id)
        question_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question_id.length > 0
        Questions.new(question_id.first)
    end

    def self.find_by_author_id(author_id)
        author_id = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless author_id.length > 0
        author_id.map{|ele| Questions.new(ele)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end



end
