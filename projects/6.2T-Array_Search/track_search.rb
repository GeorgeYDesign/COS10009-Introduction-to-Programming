require './input_functions'

# Task 6.2 T - use the code from 6.2 T to help with this

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  # you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre

# complete the missing code:
	def initialize (title, artist, genre)
		# insert lines here
		@genre = genre
	end
end

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

# Reads in and returns a single track from the given file

def read_track(music_file)
	# fill in the missing code
end

# Returns an array of tracks read from the given file

def read_tracks(music_file)
	tracks = Array.new()
	count = music_file.gets().to_i()
  	tracks = Array.new()

  # Put a while loop here which increments an index to read the tracks

  	track = read_track(music_file)
  	tracks << track

	return tracks
end

# Takes an array of tracks and prints them to the terminal

def print_tracks(tracks)
	# print all the tracks use: tracks[x] to access each track.
end

# Reads in and returns a single album from the given file, with all its tracks

def read_album(music_file)

  # read in all the Album's fields/attributes including all the tracks
  # complete the missing code

	album = Album.new(album_title, album_artist, album_genre, tracks)
	return album
end


# Takes a single album and prints it to the terminal along with all its tracks
def print_album(album)

  # print out all the albums fields/attributes
  # Complete the missing code.

	puts('Genre is ' + album.genre.to_s())
	puts($genre_names[album.genre])
	# print out the tracks

end

# Takes a single track and prints it to the terminal
def print_track(track)
  	puts('Track title is: ' + track.title)
	puts('Track file location is: ' + track.file_location)
end


# search for track by name.
# Returns the index of the track or -1 if not found
def search_for_track_name(tracks, search_string)

# Put a while loop here that searches through the tracks
# Use the read_string() function from input_functions.
# NB: you might need to use .chomp to compare the strings correctly

# Put your code here.

  return found_index
end


# Reads in an Album from a file and then prints all the album
# to the terminal

def main()
  	music_file = File.new("album.txt", "r")
	album = read_album(music_file)
  	music_file.close()

  	search_string = read_string("Enter the track name you wish to find: ")
  	index = search_for_track_name(album.tracks, search_string)
  	if index > -1
   		puts "Found " + album.tracks[index].name + " at " + index.to_s()
  	else
    	puts "Entry not Found"
  	end
end

main()
