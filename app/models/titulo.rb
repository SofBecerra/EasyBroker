class Titulo < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'json'

  # pages = (1..25)
  # pages.each do |num|
  num = 1
  loop do
  url = URI("https://api.stagingeb.com/v1/properties?page=#{num}&limit=50")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

  response = JSON.parse(http.request(request).read_body)

   propertys =  response["content"]
   if propertys.empty?
    puts "Fin de las propiedades"
    break
  end
   propertys.each do |propiedad|
   puts propiedad['title']
    end
    num += 1
  end
end
