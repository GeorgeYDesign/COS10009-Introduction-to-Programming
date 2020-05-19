require './input_functions'

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

class Album
    attr_accessor :title, :artist, :genre, :tracks
    def initialize(title, artist, genre, tracks)
        @title = title
        @artist = artist
        @genre = genre
        @tracks = tracks
    end
end

class Track
    attr_accessor :name, :location
    def initialize(name, location)
        @name = name
        @location = location
    end
end

def finished
  return true
end

def read_albums(music_file, albums)
  read_string 'Enter album filename: '
  albums = Array.new()
  read_count = music_file.gets.to_i
      index = 0
      while (index < read_count)
          albums.push(read_album(music_file))
          index += 1
      end
      music_file.close()
      puts "File has been read. Read #{read_count} albums."
      read_string("Press enter to continue")
  return albums
end


def read_album(music_file)
    album_title = music_file.gets()
    album_artist = music_file.gets()
    album_genre = music_file.gets()
    album_tracks = read_tracks(music_file)
    album = Album.new(album_title, album_artist, album_genre, album_tracks)
end

def read_tracks(music_file)
    tracks = Array.new()
    count = music_file.gets().to_i
    index = 0

    while (index < count)
    tracks.push(read_track(music_file))
    index += 1
    end
    tracks
end

def read_track(music_file)
    song_title = music_file.gets
    file_location = music_file.gets
    track = Track.new(song_title, file_location)
    track
end

def print_albums(albums)
  if (!albums)
      puts "No album has been read"
  else
          puts ""
          count = albums.length
          index = 0

          while (index < count)
              puts "The following are the details of the album #{index + 1}"
              print_album(albums[index])
              index += 1
      end
  end
  read_string("Press enter to continue...")
end

def print_album(album)
    puts 'Genre is ' + album.genre
    puts 'Artist is ' + album.artist
    puts 'Title is ' + album.title
    tracks = album.tracks
    print_tracks(album.tracks)
end

def print_tracks(tracks)
    count = tracks.length
    puts 'There are ' + count.to_s + ' tracks in this album:'
    index = 0
    while (index < count)
        print_track(tracks[index])
        index += 1
    end
end

def print_track(track)
    puts('Track title: ' + track.name)
    puts('Track file location: ' + track.location)
end

def print_album_names(albums)
  if (!albums)
      puts "No albums have been read"
  else
      puts "Play Albums"
      index = 0
      count = albums.length
      while (index < count)
          puts ("Album #{index + 1}:" + albums[index].title)
          index += 1
      end

      album_selection = read_integer_in_range("Select an album to play", 1, count)
      puts ("Tracks in album #{album_selection}: ")
      print_tracks(albums[album_selection - 1].tracks)

      track_selection = read_integer_in_range("Select a track to play", 1, (albums[album_selection].tracks.length + 1))
      puts ("Playing Track #{track_selection}: " + albums[album_selection - 1].tracks[track_selection - 1].name)
      sleep(3.0)
      read_string("Press enter to continue...")
      end
  end


  def update_album(albums)
    if (!albums)
        puts "No album has been selected."
    else
    album_menu = true
    while (album_menu  == true)
        index = 0
        count = albums.length
        modify_menu = true
        album_selection = modify_menu(albums)

        while (index < count && modify_menu == true)
            if (album_selection == (index + 1))
                puts ""
                puts ("Current Title: " + albums[index].title)
                puts ("Current Genre: " + albums[index].genre)

                puts "1: Update Title"
                puts "2: Update Genre"
                puts "3: Return"
            menu_choice = read_integer_in_range("Please select an option", 1, 3)

            case menu_choice
            when 1
                albums[album_selection - 1].title = read_string("Enter updated title: ")
                puts ("Updated Title is: " + albums[album_selection - 1].title)
                modify_menu = false
            when 2
                albums[album_selection - 1].genre = read_string("Enter updated genre: ")
                puts ("Updated Genre is:" + albums[album_selection - 1].genre)
                modify_menu = false
            when 3
                modify_menu = false
        end
        elsif (album_selection == (count + 1))
          modify_menu = false
          album_menu = false
        end
        end
      end
  end
    return albums
end

def modify_menu(albums)
    puts "Change title or genre of album"
    index = 0
    count = albums.length
    while (index < count)
        puts "Albums #{index +1} Details: "
        puts ("Title: " + albums[index].title)
        puts ("Genre: " + albums[index].genre)
        index += 1
    end

    index = 0
    while (index < count)
        puts "#{index + 1}: " + albums[index].title.chomp
        index += 1
    end
    puts("#{index + 1}: Exit Sub-Menu")
    album_selection = read_integer_in_range("Menu Choice: ", 1, (index + 1))
    return album_selection
end


  def main_menu(finished, albums)
    while (!finished)
      puts "Main Menu:"
      puts "1. Read in Album"
      puts "2. Display Album Information"
      puts "3. Play Album"
      puts "4. Update Album"
      puts "5. Exit"
      choice = read_integer_in_range("Please enter your choice: ", 1, 5)

      case choice
        when 1
          file_name = read_string("Please enter the filename of the album: ")
          music_file = File.new(file_name, "r")
          albums = read_albums(music_file, albums)
        when 2
          print_albums(albums)
        when 3
          print_album_names(albums)
        when 4
          albums = update_album(albums)
        when 5
          finished = finished()
      end
    end
  end

  def main
    finished = false;
    albums = nil
    main_menu(finished, albums)
  end

  main()
