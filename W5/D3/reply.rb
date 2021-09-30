
require 'sqlite3'
require_relative 'question_db'
require_relative 'users'
require_relative 'questions'

class Reply
  attr_reader :author_id, :parent_id, :id

    def self.all
       data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
       data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        reply_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless reply_id.length > 0
        Reply.new(reply_id.first)
    end

    def self.find_by_user_id(id)
        reply_user_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                reply_author_id = ?
        SQL
        return nil unless reply_user_id.length > 0
        reply_user_id.map{|ele| Reply.new(ele)}
    end

    def self.find_by_question_id(id)
        reply_question_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless reply_question_id.length > 0
        reply_question_id.map{|ele| Reply.new(ele)}
    end

   

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @reply_author_id = options['reply_author_id']
        @body = options['body']
    end

    def child_replies
        child_replies_record = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        return nil unless child_replies_record.length > 0
        child_replies_record.map{|ele| Reply.new(ele)}
    end

    def parent_replies
        Reply.find_by_id(parent_id)
    end

    def reply_author
        f_name = Users.find_by_id(@reply_author_id).fname
        l_name = Users.find_by_id(@reply_author_id).lname
        return f_name + ' ' + l_name
    end

    def reply_question
        return Questions.find_by_id(@question_id).body
    end

end