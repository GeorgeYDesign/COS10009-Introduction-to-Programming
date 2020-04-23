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
      puts "You selected Update Album Title. Press enter to continue"
      gets
    when 2
      puts "You selected Update Album Genre Press enter to continue"
      gets
    when 3
      puts "You selected Enter Album. Press enter to continue"
      gets
    when 4
      finished = true
    end until finished
  end
end

def play_existing_album()
  puts "You selected Play Existing Album. Press enter to continue"
  gets
end

def main
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play existing Album'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
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
