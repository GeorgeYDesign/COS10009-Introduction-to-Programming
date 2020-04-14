require './input_functions'

def maintain_albums
  # change this to display a sub-menu
  # in the sub menu the user can select
  # whether they want to:
  # 1 Enter a new album
  # 2 Update an existing album
  # 3 Return to the main menu
  # Implement stubs like this one for options 1 and 2
  finished = false
  begin
  puts 'Sub Menu Maintain Albums: Enter your selection:'
  puts '1 To Update Album Title'
  puts '2 To Update Album Genre'
  puts '3 To Enter album'
  puts '4 Return to Main Menu'
  choice = read_integer_in_range("Please enter your choice:", 1, 4)
  read_string("Press enter to continue")
  case choice
    when 1
      read_string('Update Album Title')
      finished = false
      when 2
        read_string('Update Album Genre')
        finshed = false
    when 3
      read_string('Enter Album')
      finished = false
    when 4
      finished = true
    end until finished
  end
end



def play_exisiting_album
  finished = false
  begin
  puts 'Sub Menu Maintain Albums: Enter your selection: '
  puts 'You selected Play Existing Album'
  puts '1 To Update Album Title'
  puts '2 To Update Album Genre'
  puts '3 To Enter album'
  puts '4 Return to Main Menu'
  choice = read_integer_in_range("Please enter your choice:", 1, 4)
  read_string("Press enter to continue")
  case choice
    when 1
       read_string('Update Album Title')
       finished = false
    when 2
       read_string('Update Album Genre')
       finished = false
    when 3
      read_string('Enter Album')
      finished = false
    when 4
      finished = true
    end
    end until finished

end



# complete the case statement below and
# add a stub like the one above for option 2
# of this main menu
def main
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play existing Album'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    #read_string('Press enter to continue')
    case choice
      when 1
        maintain_albums
      when 2
        play_exisiting_album
      when 3
        finished = true
    end
  end until finished
end

main()
