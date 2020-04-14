require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *0..3
end

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

class Album
    attr_accessor :album_title, :album_artist, :album_genre

    def initialize(album_title, album_artist, album_genre)
        @album_title = album_title
        @album_artist = album_artist
        @album_genre = album_genre
    end
end

def read_album()
  i = 0
  while (i < $genre_names.length)
    puts i.to_s + ":  " + $genre_names[i]
    i += 1
  end

  menu_choice = read_integer_in_range("Please select a genre:", 0, 3)

  album_title = "Title_Placeholder"
  album_artist = "Artist_Placeholder"
  album_genre = $genre_names[menu_choice]

  Album.new(album_title, album_artist, album_genre)
end

def print_album album
  puts('Album information is: ')
  puts 'Album: ' + album.album_title
  puts 'Artist: ' + album.album_artist
  puts 'Genre: ' + album.album_genre
end

def main
	album = read_album()
	print_album(album)
end

main
