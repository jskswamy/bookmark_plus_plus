require 'www/delicious'

username = ARGV[0]
password = ARGV[1]

delicious = WWW::Delicious.new(username, password)
url_tag_map = delicious.posts_all(:tag => 'ruby').collect do |post|
  map = {}
  map["url"] = post.url.to_s
  map["tags"] = post.tags
  map
end
p url_tag_map
