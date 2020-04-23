require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

# Uh oh - the following is a global variable
# What do we say about using global variables in the lecture notes?
$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

class Album
	attr_accessor :title, :artist, :genre, :tracks

	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end

# Reads in and returns a single track from the terminal

def read_track
	# Complete the missing code
	Track.new(track_name, track_location)
end

# Reads in and returns an array of multiple tracks from the given file

def read_tracks
	tracks = Array.new()
	count = read_integer_in_range("Enter track count: ", 0, 15)
	# Complete the missing code
	tracks
end

# Display the genre names in a
# numbered list and ask the user to select one
def read_genre()
  length = $genre_names.length

  # Complete the missing code

    puts "#{index + 1} " + $genre_names[index]

  # Complete the missing code
end

# Reads in and returns a single album from the terminal, with all its tracks

def read_album
	# Complete the missing code
  album_title = "Some title"
  album_artist = "Some artist"
  album_genre = Genre::POP
  tracks = []
	album = Album.new(album_title, album_artist, album_genre, tracks)
	album
end

# Takes an array of tracks and prints them to the terminal

def print_tracks tracks
	# Complete the missing code
end

# Takes a single album and prints it to the terminal

def print_album album
	# Complete the missing code
	puts 'Genre is ' + album.genre.to_s
	puts $genre_names[album.genre]
	print_tracks(album.tracks)
end

# Reads in an array of albums from a file and then prints all the albums in the
# array to the terminal

def main
  puts "Welcome to the music player"
	album = read_album()
	print_album(album)
end

main
