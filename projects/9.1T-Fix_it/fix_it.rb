def write(aFile, number)
  aFile.puts(number)
  index = 0
  while (index < number)
   aFile.puts(index)
   index += 1
  end
end

def read(aFile)
  count = aFile.gets().to_i
  if (is_numeric?(count))
    count = count.to_i
  else
    count = 0
    puts "Error: first line of file is not a number"
  end

  index = 0
  while (count < index)
    line = aFile.gets()
    puts "Line read: " + line
  end
end


def main
  aFile = File.new("mydata.txt", "w")
  if aFile
    write(aFile, 10)
  else
    puts "Unable to open file to write!"
  end
  if aFile
  aFile = File.new("mydata.txt", "r")
    read(aFile)
  end
  aFile.close
end

def is_numeric?(obj)
  puts obj
  result = false
  if /[^0-9]/.match(obj.to_s) == nil
    result = true
  end
  return result
end

main()
