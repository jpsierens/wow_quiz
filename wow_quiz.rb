require "./classes.rb"

def print_instructions
    puts "lets see how many classes you can name from WoW!!"
    puts "-------------------------------------------------"
    puts "Instructions:"
    puts "Type them in and separate with spaces"
    puts "If the class has multiple words, unit them like BananaApple (note the uppercases)"
end

def format_input(input)
    input.split.map(&:downcase).uniq
end

def get_input()
    puts ">"
    input = $stdin.gets.chomp
end

def is_correct(answer)      
    if answer.sort != CLASSES.sort
        return false
    end

    true
end

def handle_wrong_answer(answer)
    partial_answers = answer & CLASSES
    if partial_answers.any?
        return "You have the following classes correct: #{partial_answers.join(' ')}. Retype them and the missing ones"
    end

    return "Wrong, keep trying! or press CTRL+C to finish"
end

def play()
    print_instructions()
    
    finished = false
    
    until finished
        input = get_input()
        answer = format_input(input)

        if is_correct(answer)
            return puts "Correct!! Thanks for playing"
        end

        puts handle_wrong_answer(answer)
    end
end