require 'rubygems'
require 'gosu'
require './input_functions'

TOP_COLOR = Gosu::Color.new(0xFF2ecc71)
BOTTOM_COLOR = Gosu::Color.new(0xFF27ae60)

module ZOrder
  BACKGROUND, PLAYER, UI = *0..2
end

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

GENRE_NAMES = ['Null', 'Pop', 'Hip-hop', 'Rock', 'Jazz']

class ArtWork
	attr_accessor :bmp
	def initialize (file)
		@bmp = Gosu::Image.new(file)
	end
end

class Track
  attr_accessor :tra_key, :name, :location
    def initialize (tra_key, name, location)
      @tra_key = tra_key
      @name = name
      @location = location
     end
end

class Album
  attr_accessor :pri_key, :title, :artist,:artwork, :genre, :tracks
  def initialize (pri_key, title, artist,artwork, genre, tracks)
    @pri_key = pri_key
    @title = title
		@artist = artist
		@artwork = artwork
    @genre = genre
    @tracks = tracks
   end
end

class Song
	attr_accessor :song
	def initialize (file)
		@song = Gosu::Song.new(file)
	end
end

class MusicPlayerMain < Gosu::Window

	def initialize
	    super 800, 600
			self.caption = "Music Player"
			@locs = [60,60]
			@font = Gosu::Font.new(30)
			@a = 0
			@t = 0
	end

	def load_album()
			def read_track (music_file, i)
				track_key = i
				track_name = music_file.gets
				track_location = music_file.gets.chomp
				track = Track.new(track_key, track_name, track_location)
				return track
			end

			def read_tracks music_file
				count = music_file.gets.to_i
				tracks = Array.new()
				i = 0
				while i < count
					track = read_track(music_file, i+1)
					tracks << track
					i = i + 1
				end
				tracks
			end

			def read_album(music_file, i)
				album_pri_key = i
				album_title = music_file.gets.chomp
				album_artist = music_file.gets
				album_artwork = music_file.gets.chomp
				album_genre = music_file.gets.to_i
				album_tracks = read_tracks(music_file)
				album = Album.new(album_pri_key, album_title, album_artist,album_artwork, album_genre, album_tracks)
				return album
			end

			def read_albums(music_file)
				count = music_file.gets.to_i
				albums = Array.new()
				i = 0
					while i < count
						album = read_album(music_file, i+1)
						albums << album

						i = i + 1
					end
				return albums
			end

			music_file = File.new("file.txt", "r")
			albums = read_albums(music_file)
			return albums
		end


	def needs_cursor?; true; end



	def draw_albums(albums)
			@bmp = Gosu::Image.new(albums[0].artwork)
			@bmp.draw(50, 50 , z = ZOrder::PLAYER)

			@bmp = Gosu::Image.new(albums[1].artwork)
			@bmp.draw(50, 310, z = ZOrder::PLAYER)

			@bmp = Gosu::Image.new(albums[2].artwork)
			@bmp.draw(310, 50 , z = ZOrder::PLAYER)

			@bmp = Gosu::Image.new(albums[3].artwork)
			@bmp.draw(310, 310, z = ZOrder::PLAYER)
	end

	def draw_button()
		@bmp = Gosu::Image.new("image/play.png")
		@bmp.draw(50, 480, z = ZOrder::UI)

		@bmp = Gosu::Image.new("image/pause.png")
		@bmp.draw(150, 480, z = ZOrder::UI)

		@bmp = Gosu::Image.new("image/stop.png")
		@bmp.draw(250, 480, z = ZOrder::UI)

		@bmp = Gosu::Image.new("image/next.png")
		@bmp.draw(350, 480, z = ZOrder::UI)
	end

	def draw_background()
		draw_quad(0,0, TOP_COLOR, 0, 600, TOP_COLOR, 800, 0, BOTTOM_COLOR, 800, 600, BOTTOM_COLOR, z = ZOrder::BACKGROUND)
	end

	def draw_text(a)
		albums = load_album()

end

	def draw
		albums = load_album()
		i = 0
		x = 500
		y = 0
		draw_albums(albums)
		draw_button()
		draw_background()
		if (!@song)
			while i < albums.length
				@font.draw("#{albums[i].title}", x , y+=100, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
				i+=1
			end
		else
			while i < albums[@a-1].tracks.length
				@font.draw("#{albums[@a-1].tracks[i].name}", x , y+=50, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
				if (albums[@a-1].tracks[i].tra_key == @t)
					@font.draw("*", x-20 , y, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
				end
				i+=1
			end
		end
	end

	def playTrack(t, a)
		albums = load_album()
		i = 0
		while i < albums.length
			if (albums[i].pri_key == a)
				tracks = albums[i].tracks
				j = 0
						while j< tracks.length
								if (tracks[j].tra_key == t)
									@song = Gosu::Song.new(tracks[j].location)
									@song.play(false)
								end
								j+=1
						end
			end
			i+=1
		end
 end

 def update()
	if (@song)
		if (!@song.playing?)
			@t+=1
		end
	end
 end

def status()
   @font.draw("The track you selected; " + @song + "from the album" + @album + "is now playing", 0, 0, 1, 1.0, 1.0, Gosu::Color::BLACK)
end

	def area_clicked(mouse_x, mouse_y)
		if ((mouse_x >50 && mouse_x < 201)&& (mouse_y > 50 && mouse_y < 201 ))# x album
			@a = 1
			@t = 1
			playTrack(@t, @a)
		end
		if ((mouse_x > 50 && mouse_x < 210) && (mouse_y > 310 && mouse_y <470))# starboy album
			@a = 2
			@t = 1
			playTrack(@t, @a)
		end
		if ((mouse_x > 310 && mouse_x < 470) && (mouse_y > 50 && mouse_y <210))# do-wops album
			@a = 3
			@t = 1
			playTrack(@t, @a)
		end
		if ((mouse_x > 310 && mouse_x < 470) && (mouse_y > 310 && mouse_y <470))# back in black album
			@a = 4
			@t = 1
			playTrack(@t, @a)
		end
		if ((mouse_x >250 && mouse_x < 375)&& (mouse_y > 500 && mouse_y < 625 ))#stop
			@song.stop
		end
		if ((mouse_x >50 && mouse_x < 175)&& (mouse_y > 500 && mouse_y < 625 ))#play
			@song.play
		end
		if ((mouse_x >150 && mouse_x < 275)&& (mouse_y > 500 && mouse_y < 625 ))#pause
			@song.pause
		end
		if ((mouse_x >350 && mouse_x < 475)&& (mouse_y > 500 && mouse_y < 625 ))#next
			if (@t == nil)
				@t = 1
			end
			@t += 1
			playTrack(@t, @a)
		end
 end

	def button_down(id)
		case id
			when Gosu::MsLeft
				@locs = [mouse_x, mouse_y]
				area_clicked(mouse_x, mouse_y)
	    end
	end
end
MusicPlayerMain.new.show if __FILE__ == $0
