module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
	attr_accessor :title, :artist, :genre, :tracks
	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
    @genre = genre
    @tracks = tracks
	end
end

class Track
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end

def read_track music_file
	name = music_file.gets()
	location = music_file.gets()
	track = Track.new(name, location)
  return track
end

def read_tracks music_file
    count = music_file.gets().to_i
    tracks = Array.new()
	i = 0
	while (i < count)
  	track = read_track(music_file)
  	tracks << track
		i += 1
	end
	return tracks
end

def print_tracks tracks
    index = 0
    while index < tracks.length
        print_track tracks[index]
        index += 1
    end
end

def print_track track
    puts('Track title is: ' + track.name)
    puts('Track file location is: ' + track.location)
end

def read_album music_file
    artist = music_file.gets.chomp
    title = music_file.gets.chomp
    genre = music_file.gets.chomp.to_i
    Album.new(artist, title, genre, read_tracks(music_file))
end

def print_album album
    puts 'Title is ' + album.title.to_s
	  puts 'Artist is ' + album.artist.to_s
	  puts 'Genre is ' + $genre_names[album.genre]
    print_tracks(album.tracks)
end

def main
  music_file = File.new("album.txt", "r")
    album = read_album(music_file)
  music_file.close()
    print_album(album)
end

main()
