require 'pry'

class Pokemon


    attr_accessor :name, :type, :id, :db

    def initialize (name)
        @id = id 
        @name = name
        @type = type
        @db = db 
        # binding.pry
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS pokemons (
                id INTEGER PRIMARY KEY,
                name TEXT,
                type TEXT,
                db TEXT
            );
        SQL
        DB[:conn].execute(sql)
    end

    def self.save 
        sql = <<-SQL
            INSERT INTO pokemon (name, type, db)
            VALUES (?, ?, ?);
        SQL
        DB[:conn].execute(sql, self.name, self.type, self.db)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
    end

    def self.find(id_num, db)	
        pokemon_info = db.execute("SELECT * FROM pokemons WHERE id=?", id_num).first	
    end


end
