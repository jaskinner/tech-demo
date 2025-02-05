require "db"
require "sqlite3"

def insert_price(price : Float64, time : Int64, date : Int32)
  DB.open "sqlite3:///var/lib/sqlite/data.db" do |db|
    db.exec "insert into prices (price, time, date) values (?, ?, ?)", price, time, date
  end
rescue ex : SQLite3::Exception
  puts ex.message
end

def fetch_prices : String
  prices = ""
  DB.open "sqlite3:///var/lib/sqlite/data.db" do |db|
    db.query "select * from prices" do |rs|
      rs.each do
        prices += "#{rs.read(Float64)} #{rs.read(Int64)} #{rs.read(Int32)}\n"
      end
    end
  end
  prices
end

p fetch_prices
