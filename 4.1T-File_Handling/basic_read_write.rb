def write_data_to_file()
a_file = File.new("mydata.txt", "w")
    if a_file
  a_file.puts('5')
  a_file.puts('Fred')
  a_file.puts('Sam')
  a_file.puts('Jill')
  a_file.puts('Jenny')
  a_file.puts('Zorro')
  a_file.close
    else
      puts "Unable to open file to write!"
    end
  end

def read_data_from_file()
a_file = File.new("mydata.txt", "r")
    if a_file
    count = a_file.gets.to_i
    puts count.to_s
    i = 0
    while i < count do
      puts a_file.gets
      i += 1
    end
    a_file.close
    else
      puts "Unable to open file to read!"
    end
end

def main
    write_data_to_file()
    read_data_from_file()
end

main()
