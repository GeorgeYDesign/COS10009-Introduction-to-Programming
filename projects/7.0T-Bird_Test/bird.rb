require './input_functions'

# Complete the code below
# Use input_functions to read the data from the user
class Bird
    attr_accessor :id, :location, :species, :cage_number
    def initialize (id, location, species, cage_number)
        @id = id
        @location = location
        @species = species
        @cage_number = cage_number
    end
end

def read_bird()
	id = read_integer('Enter bird id: ')
    location = read_string('Enter bird location: ')
    species = read_string('Enter bird species: ')
    cage_number = read_integer('Enter bird cage number: ')
    bird = Bird.new(id, location, species, cage_number)
    return bird
end

def read_birds()
	birds = Array.new()
    count = read_integer_in_range('How many birds are you entering: ', 1, 3)
    i = 0
    while (i < count)
        bird = read_bird()
        birds << bird
        i += 1
    end
    return birds
end

def print_bird(bird)
	puts('Id ' + bird.id.to_s)
    puts('Location ' + bird.location)
    puts('species ' + bird.species)
    puts('Cage Number ' + bird.cage_number.to_s)
end

def print_birds(birds)
	index = 0
    while (index < birds.length)
        print_bird(birds[index])
        index += 1
    end
end

def main()
	birds = read_birds
    print_birds(birds)
end

main()
