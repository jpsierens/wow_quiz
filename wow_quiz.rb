require "./classes.rb"

def evaluate_input(input)
    # need to turn into array and remove dups
    answer = input.split.uniq
        
    if answer.sort != CLASSES.sort
        return false
    end

    true
end

def play()
    puts "lets see how many classes you can name from WoW!!"
    puts "-------------------------------------------------"
    puts "Instructions:"
    puts "Type them in and separate with spaces"
    puts "If the class has multiple words, unit them like BananaApple (note the uppercases)"
    
    is_correct = false
    
    until is_correct
        puts ">"
        input = $stdin.gets.chomp
    
        is_correct = evaluate_input(input)

        if is_correct then return end
        puts "Wrong, keep trying! or press CTRL+C to finish"
    end
    
    puts "Correct!! Thanks for playing"
end