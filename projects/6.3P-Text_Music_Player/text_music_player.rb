require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *0..3
end

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

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

def read_track
	track_name = read_string("Please enter the track name: ")
	track_location = read_string("Please enter the track location: ")
	Track.new(track_name, track_location)
end

def read_tracks
	tracks = Array.new()
	count = read_integer_in_range("Enter track count (Between 1-15): ", 0, 15)
	i = 0
	while (i < count)
			track = read_track
			tracks << track
			i += 1
		end
	return tracks
end

def read_genre()
puts ''
i = 0
 while (i < $genre_names.length)
    puts i.to_s + ":  " + $genre_names[i]
    i += 1
  end
	genre = read_integer_in_range('Please select a genre: ', 0, 3)
	return genre
end

def read_album
	album_title = read_string("Please enter an album name: ")
	album_genre = read_genre()
  	album_artist = read_string("Please enter the album artist: ")
  	tracks = read_tracks()
	album = Album.new(album_title, album_artist, album_genre, tracks)
	return album
end

def print_track track
	puts("Track title is: " + track.name)
	puts("Track location is: " + track.location)
end

def print_tracks tracks
	index = 0
	while (index < tracks.length)
		print_track(tracks[index])
		index += 1
	end
end

def print_album album
	puts 'Album is ' + album.title
	puts 'Genre is ' + album.genre.to_s
	puts $genre_names[album.genre]
	print_tracks(album.tracks)
end

def main
	puts "Welcome to the music player"
	album = read_album()
	print_album(album)
end

main()
