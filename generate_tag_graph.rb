url_tags = [
  {:url => "http://guides.rubyonrails.org/3_2_release_notes.html", :tags => ['technology', 'rails', 'rails 3.2', 'ruby']},
  {:url => "http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html", :tags => ['technology', 'ruby 1.9.3', 'ruby']},
  {:url => "http://www.bbc.co.uk/news/world-africa-17787142", :tags => ['news', 'bbc', 'sudan']}
]

tag_mapping = []
url_tags.collect{|url_tag| ["My links", *url_tag[:tags]].each_cons(2){|a, b| tag_mapping << a; tag_mapping << b}}.flatten
dg=RGL::DirectedAdjacencyGraph[*tag_mapping]
dg.write_to_graphic_file('jpg', "tag_map")
