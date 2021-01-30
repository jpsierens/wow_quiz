require "./classes.rb"

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
    puts "lets see how many classes you can name from WoW!!"
    puts "-------------------------------------------------"
    puts "Instructions:"
    puts "Type them in and separate with spaces"
    puts "If the class has multiple words, unit them like BananaApple (note the uppercases)"
    
    is_correct = false
    
    until is_correct
        puts ">"
        input = $stdin.gets.chomp
        answerArray = input.split.uniq

        if is_correct(answerArray)
            return puts "Correct!! Thanks for playing"
        end

        puts handle_wrong_answer(answerArray)
    end
end