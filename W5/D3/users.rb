require 'sqlite3'
require_relative 'question_db'

class Users

    attr_accessor :fname, :lname

    def self.all
       data = QuestionsDatabase.instance.execut e("SELECT * FROM users")
        data.map { |datum| Users.new(datum) }
    end

    def self.find_by_id(id)
        user_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user_id.length > 0
        Users.new(user_id.first)

    end

    def self.find_by_name(fname, lname)
        #raise error
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless user.length > 0
        user.map{|ele| Users.new(ele)}
    end

     def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

end







