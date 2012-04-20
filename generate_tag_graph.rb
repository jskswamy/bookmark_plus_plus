require 'rgl/adjacency'
require 'rgl/dot'

url_tags = [
  {:url => "http://guides.rubyonrails.org/3_2_release_notes.html", :tags => ['technology', 'rails', 'rails 3.2']},
  {:url => "http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html", :tags => ['technology', 'rails 3.2', 'ruby 1.9.3', 'ruby']},
  {:url => "http://www.bbc.co.uk/news/world-africa-17787142", :tags => ['news', 'bbc', 'sudan']}
]

ROOT_TAG_NAME = "My links"

tag_mapping = []
url_tags.collect{|url_tag| [ROOT_TAG_NAME, *url_tag[:tags]].each_cons(2){|a, b| tag_mapping << a; tag_mapping << b}}.flatten
distinct_tags = dg.vertices - [ROOT_TAG_NAME]
leaf_tags_mapping = url_tags.inject({}){|r, url_tag| r.merge(url_tag[:url] => url_tag[:tags].last)}
leaf_tags_mapping.collect {|url, leaf_tag|  tag_mapping << leaf_tag; tag_mapping << url}
dg=RGL::DirectedAdjacencyGraph[*tag_mapping]
dg.write_to_graphic_file('jpg', "tag_map")
