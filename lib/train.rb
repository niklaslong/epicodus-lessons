module Train
  def self.all
    DB.exec("SELECT * FROM trains;").to_a
  end

  def self.save(name, uuid)
    DB.exec("INSERT INTO trains (id, name) VALUES ('#{uuid}', '#{name}') RETURNING id;")[0]["id"]
  end
end
