require './input_functions'

def maintain_albums
  finished = false
  begin
  puts 'Sub Menu Maintain Albums: Enter your selection:'
  puts '1 To Update Album Title'
  puts '2 To Update Album Genre'
  puts '3 To Enter album'
  puts '4 Return to Main Menu'
  choice = read_integer_in_range("Please enter your choice:", 1, 4)
  case choice
    when 1
      update_album_title
    when 2
      update_album_genre
    when 3
      enter_album
    when 4
      finished = true
    else
      puts 'Please Select Again'
    end until finished
  end
end

def play_existing_album()
  puts 'You selected Play Existing Album'
  read_string ('Press enter to continue')
end

def update_album_title()
  puts 'You selected Update Album Title'
  read_string ('Press enter to continue')
end

def update_album_genre()
  puts 'You selected Update Album Genre'
  read_string ('Press enter to continue')
end

def enter_album()
  puts 'You selected Enter Album'
  read_string ('Press enter to continue')
end

def main
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play existing Album'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    read_string('Press enter to continue')
    case choice
      when 1
        maintain_albums
      when 2
        play_existing_album
      when 3
        finished = true
    end
  end until finished
end

main()
