# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require 'uri'
require 'net/http'
require 'json'

# pages = (1..25)
# pages.each do |num|
num = 1
loop do
url = URI("https://api.stagingeb.com/v1/properties?page=#{num}&limit=20")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

response = JSON.parse(http.request(request).read_body)

 propertys =  response["content"]
 if propertys.empty?
  puts "No hay más propiedades disponibles. Terminando la búsqueda."
  break
end
 propertys.each do |propiedad|
 puts propiedad['title']
  end
  num += 1
end
