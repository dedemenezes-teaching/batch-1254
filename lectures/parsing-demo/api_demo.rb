require "json"
require "open-uri" # to do HTTP Requests

# TODO - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/ssaunier"

user_serialized = URI.open(url).read
# p user_serielized
user = JSON.parse(user_serialized)
p user["avatar_url"]
