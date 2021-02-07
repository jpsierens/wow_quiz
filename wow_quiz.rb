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

def is_correct?(answer)      
    if answer.sort != CLASSES.sort
        return false
    end

    true
end

def handle_current(input)
    current_wrong_answers = input.uniq - CLASSES
    if current_wrong_answers.any?
        puts "The following classes are wrong: #{current_wrong_answers.join(' ')}"
    end

    current_correct_answers = input.uniq & CLASSES
    if current_correct_answers.any?
        puts "The following classes are right: #{current_correct_answers.join(' ')}"
    end
end

def handle_total(partial_correct_answers)
    if partial_correct_answers.any?
        missing_classes = CLASSES - partial_correct_answers
        puts "You have the following classes correct: #{partial_correct_answers.join(' ')}. You are missing #{missing_classes.length} classes"
        puts "Heres a hint for a missing class: #{CLASS_HINTS[missing_classes[0]]}"
    end
end

def play()
    print_instructions
    past_answer = []
    finished = false
    
    until finished
        formatted_input = format_input get_input
        total_input = (formatted_input + past_answer).uniq

        if formatted_input[0] == 'quit'
            return puts "Thanks for playing!"
        end

        if is_correct? total_input
            return puts "Correct!! You guessed all classes! Thanks for playing"
        end

        handle_current formatted_input

        # get the union of the answer+input with the correct classes
        partial_correct_answers = total_input.uniq & CLASSES
        handle_total partial_correct_answers

        puts "Keep typing classes or write 'quit' to finish"
        past_answer = partial_correct_answers
    end
end