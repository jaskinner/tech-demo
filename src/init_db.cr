require "db"
require "sqlite3"

DB.open("sqlite3:///var/lib/sqlite/data.db") do |db|
  db.exec "CREATE TABLE IF NOT EXISTS prices (price REAL, time INTEGER, date INTEGER)"
end

puts "Database initialized."
