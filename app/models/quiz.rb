class Quiz
  DB = PG.connect({:host=>"localhost", :port => 5432, :dbname => 'quiz_backend_development'})

  def self.all
      results = DB.exec("SELECT * FROM quiz;")
      return results.each do |result|
        {
          "id" => result["id"].to_i,
          "question" => result["question"],
          "answer" => result["answer"],
          "answer_char" => result["answer_char"],
          "point_value" => result["point_value"]

        }
      end
    end

  def self.find(id)
    results = DB.exec("SELECT * FROM quiz WHERE id=#{id};")
    return {
      "id" => results.first["id"].to_i,
      "question" => results["question"],
      "answer" => results["answer"],
      "answer_char" => results["answer_char"],
      "point_value" => results["point_value"]
    }
  end

  def self.create(opts)
    results = DB.exec(
        <<-SQL
            INSERT INTO quiz (question, answer, answer_char, point_value)
            VALUES ( '#{opts["question"]}', '#{opts["answer"]}', '#{opts["answer_char"]}', #{opts["point_value"]} )
            RETURNING id, question, answer, answer_char, point_value;
        SQL
    )
    return {
        "id" => results.first["id"].to_i,
        "question" => results["question"],
        "answer" => results["answer"],
        "answer_char" => results["answer_char"],
        "point_value" => results["point_value"]
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
            SET question='#{opts["question"]}', answer='#{opts["answer"]}', answer_char='#{opts["answer_char"]}', point_value=#{opts["point_value"]}
            WHERE id=#{id}
            RETURNING id, question, answer, answer_char, point_value;
        SQL
    )
    return {
        "id" => results.first["id"].to_i,
        "question" => results["question"],
        "answer" => results["answer"],
        "answer_char" => results["answer_char"],
        "point_value" => results["point_value"]
    }
  end
end