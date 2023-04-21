def tag(tag, content, attributes = {})
  flat_attributes = attributes.map { |key, value| " #{key}='#{value}'" }.join
  "<#{tag}#{flat_attributes}>#{content}</#{tag}>"
end

p tag("h1", "Hello world")
# => <h1>Hello world</h1>

p tag("h1", "Hello world", { class: "bold" })
# => <h1 class='bold'>Hello world</h1>

p tag("a", "Le Wagon", { href: "http://lewagon.org", class: "btn" })
# => <a href='http://lewagon.org' class='btn'>Le Wagon</a>
