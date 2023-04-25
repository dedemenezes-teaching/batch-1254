require_relative 'scrape'
p fetch_movie_urls == ["/title/tt0111161/",
"/title/tt0068646/",
"/title/tt0468569/",
"/title/tt0071562/",
"/title/tt0050083/"]

p scrape_movie("/title/tt0111161/") == {
  cast: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"],
    # Only the first 3 first actress/actors
  director: "Frank Darabont",
  storyline: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.",
  title: "The Shawshank Redemption",
  year: 1994
}
