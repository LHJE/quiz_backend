class Quiz
  DB = PG.connect({:host=>"localhost", :port => 5432, :dbname => 'quiz_backend_development'})

  def self.all
      results = DB.exec("SELECT * FROM quiz;")
      return results.each do |result|
        {
          "id" => result["id"].to_i,

        }
      end
    end

  def self.find(id)
    results = DB.exec("SELECT * FROM quiz WHERE id=#{id};")
    return {
      "id" => results.first["id"].to_i,

    }
  end

  def self.create(opts)
    results = DB.exec(
        <<-SQL
            INSERT INTO quiz (question, answer)
            VALUES ( '#{opts["question"]}', #{opts["answer"]} )
            RETURNING id, question, answer;
        SQL
    )
    return {
        "id" => results.first["id"].to_i,

    }
  end

  def self.delete(id)
    results = DB.exec("DELETE FROM quiz WHERE id=#{id};")
    return { "deleted" => true }
  end

  def self.update(id, opts)
    results = DB.exec(
        <<-SQL
            UPDATE people
            SET name='#{opts["question"]}', age=#{opts["answer"]}
            WHERE id=#{id}
            RETURNING id, question, answer;
        SQL
    )
    return {
        "id" => results.first["id"].to_i,
        
    }
  end
end
