require 'net/http'
require 'json'
username = ARGV[0]
password = ARGV[1]
url = "https://readitlaterlist.com/v2/get?username=#{username}&password=#{password}&apikey=c5eADU89d752efaN19p3a0GZ34TYeX4b"
uri = URI.parse(url)
conn = Net::HTTP.new(uri.host, uri.port)
conn.use_ssl = true
response = conn.request_get(uri.request_uri)
list = response.is_a?(Net::HTTPOK) ? JSON.parse(response.body)["list"] : {}
urls = list.collect do |item_id, item|
  item["url"]
end
p urls
