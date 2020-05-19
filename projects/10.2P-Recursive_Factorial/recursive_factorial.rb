# Recursive Factorial

# Complete the following
def factorial(n)
  if n == 0
        1
    else
        n * factorial(n-1)
    end
end

# Add to the following code to prevent errors for ARGV[0] < 1 and ARGV.length < 1
def main
  if ARGV[0].to_i > 1
    puts factorial(ARGV[0].to_i)
  else
    puts("Incorrect Argument - need a single argument with a value of zero or more.")
  end
end

main()
