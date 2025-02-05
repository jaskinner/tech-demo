require "http/server"
require "./init_db"
require "./db"
require "./scraper"

server = HTTP::Server.new do |context|
  if context.request.path == "/prices"
    context.response.content_type = "application/json"
    context.response.print fetch_prices
    next
  elsif context.request.path == "/scraper"
    update_db
    context.response.print "Prices updated"
    next
  elsif context.request.path == "/favicon.ico"
    context.response.print ""
    next
  elsif context.request.path == "/"
    context.response.content_type = "text/html"
    context.response.print File.read("public/index.html")
    next
  else
    context.response.status_code = 404
    context.response.print "Not found"
  end
end

address = server.bind_tcp("0.0.0.0", 8080)
puts "Listening on http://#{address}"
server.listen
