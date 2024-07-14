class Titulo < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'json'

  url = URI("https://api.easybroker.com/v1/properties?page=1&limit=20")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["X-Authorization"] = 'hl1cksubmiknligs7l1psug9wt76bd'

  response = http.request(request)
  puts response.read_body
end
