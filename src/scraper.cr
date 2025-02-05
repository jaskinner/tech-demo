require "http"
require "myhtml"
require "./db"

def scraper : Float64
  url = "https://bush-daisy-tellurium.glitch.me/"

  headers = HTTP::Headers.new
  headers.add("Referer", "https://bush-daisy-tellurium.glitch.me/")
  html = HTTP::Client.get(url, headers).body

  myhtml = Myhtml::Parser.new(html)

  price = 0.0

  myhtml.nodes(:div).each do |node|
    if node.attributes["class"] != "content"
      next
    end

    if node.css("h3").first.inner_text != "AW SuperFast Roadster"
      next
    end

    price = node.css("div.price").first.inner_text.to_s.gsub("$", "").gsub(",", "").to_f64
  end

  price
end

def update_db
  insert_price(scraper(), Time.local.to_unix, Time.local.year * 10000 + Time.local.month * 100 + Time.local.day)
end

update_db
