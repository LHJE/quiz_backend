class Quiz
  DB = PG.connect({:host=>"localhost", :port => 5432, :dbname => 'quiz_backend_development'})

  def self.all
      results = DB.exec("SELECT * FROM ;")
      return results.each do |result|
        {
          "" => result["i"],

        }
      end
    end

  def self.find(id)
    results = DB.exec("SELECT * FROM  WHERE id=#{id};")
    return {
      "" => results.first[""],

    }
  end

  def self.create(opts)
    results = DB.exec(
        <<-SQL
            INSERT INTO  (,)
            VALUES ( '#{opts[""]}',)
            RETURNING id, ;
        SQL
    )
    return {
        "" => results.first[""],

    }
  end

  def self.delete(id)
    results = DB.exec("DELETE FROM people WHERE id=#{id};")
    return { "deleted" => true }
  end

  def self.update(id, opts)
    results = DB.exec(
        <<-SQL
            UPDATE
            SET ,
            WHERE id=#{id}
            RETURNING id, ;
        SQL
    )
    return {
        "id" => results.first["id"].to_i,
        
    }
  end
end
