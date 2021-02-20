# frozen_string_literal: true

require './classes'

def print_instructions
  puts 'lets see how many classes you can name from WoW!!'
  puts '-------------------------------------------------'
  puts 'Instructions:'
  puts 'Type them in and separate with spaces'
  puts 'If the class has multiple words, unit them like BananaApple (note the uppercases)'
end

def format_input(input)
  input.split.map(&:downcase).uniq
end

def input
  puts '>'
  $stdin.gets.chomp
end

def correct?(answer)
  return false if answer.sort != CLASSES.sort

  true
end

def handle_current(input)
  current_wrong_answers = input - CLASSES
  puts "The following classes are wrong: #{current_wrong_answers.join(' ')}" if current_wrong_answers.any?

  current_correct_answers = input & CLASSES
  puts "The following classes are right: #{current_correct_answers.join(' ')}" if current_correct_answers.any?
end

def handle_total(partial_correct_answers)
  return unless partial_correct_answers.any?

  missing_classes = CLASSES - partial_correct_answers
  puts "You have the following classes correct: #{partial_correct_answers.join(' ')}. You are missing #{missing_classes.length} classes"
  puts "Heres a hint for a missing class: #{CLASS_HINTS[missing_classes[0]]}"
end

def play
  print_instructions
  past_answer = []
  finished = false

  until finished
    formatted_input = format_input input
    return puts 'Thanks for playing!' if formatted_input[0] == 'quit'

    total_input = (formatted_input + past_answer).uniq

    return puts 'Correct!! You guessed all classes! Thanks for playing' if correct? total_input

    handle_current formatted_input

    # get the union of the answer+input with the correct classes
    partial_correct_answers = total_input.uniq & CLASSES
    handle_total partial_correct_answers

    puts "Keep typing classes or write 'quit' to finish"
    past_answer = partial_correct_answers
  end
end
