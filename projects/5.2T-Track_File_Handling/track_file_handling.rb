class Track
  attr_accessor :track_title, :track_location
  def initialize(track_title, track_location)
    @track_title = track_title
    @track_location = track_location
    track = File.open("input.txt")
  end
end

def read_tracks music_file
	count = music_file.gets().to_i
  tracks = Array.new
  i = 0
  while (i < count)
    track = read_track(music_file)
    tracks << track
    i += 1
  end
tracks
end

def read_track a_file
  track_title = a_file.gets()
  track_location = a_file.gets()
  track = Track.new(track_title, track_location)
 track
end

def print_tracks tracks
  index = 0
  while index < tracks.length
    print_track tracks[index]
    index += 1
  end
end

def print_track track
  puts('Track title is: ' + track.track_title)
	puts('Track file location is: ' + track.track_location)
end

def main
  a_file = File.new("input.txt", "r")
  if a_file
    tracks = read_tracks(a_file)
    a_file.close
  else
    puts "Unable to open file to read!"
  end
  print_tracks(tracks)
end

main
