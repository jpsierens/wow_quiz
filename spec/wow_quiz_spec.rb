# frozen_string_literal: true

require './wow_quiz'
require './classes'

describe 'wow quiz' do
  describe 'input' do
    it 'is formatted correctly' do
      input = 'Priest Paladin'
      expect(format_input(input)).to eq %w[priest paladin]
    end
  end

  describe 'enters all correct classes' do
    it 'passes the quiz' do
      allow($stdin).to receive(:gets).and_return(CLASSES.join(' '))

      # by expecting a /value/ you are testing that the value you passed is included in the stdout.
      # Passing 'value' fails since it expects the whole stdout output to match
      expect { play }.to output(/Correct!! You guessed all classes! Thanks for playing/).to_stdout
    end
  end

  describe 'enters correct classes but with different casing' do
    it 'passes the test since we dont care about casing' do
      # dup instead of clone since dup doesnt copy the "frozen status" attr of CLASSES
      classes = CLASSES.dup
      # push to the array so we dont have to write all the classes here, it will get downcased and uniq'd later
      # so if we do have the same word, it will end up with the correct array of classes (e.g. pRiEst => priest)
      input = classes.push('pRiEst').join(' ')
      allow($stdin).to receive(:gets).and_return(input)
      expect { play }.to output(/Correct!! You guessed all classes! Thanks for playing/).to_stdout
    end
  end

  describe 'enters everything wrong' do
    it "tells you what's wrong" do
      input = 'Bard SpellBreaker Necromancer'
      # receives the var
      # input for the first run of the loop, and 'quit' for the second
      allow($stdin).to receive(:gets).and_return(input, 'quit')
      expect { play }.to output(/The following classes are wrong: bard spellbreaker necromancer/).to_stdout
    end
  end

  describe 'enters partially correct' do
    it 'tells you what is correct and what is wrong' do
      input = 'Priest Paladin Bard'
      expected = /The following classes are wrong: bard\nThe following classes are right: priest paladin/
      allow($stdin).to receive(:gets).and_return(input, 'quit')
      expect { play }.to output(expected).to_stdout
    end

    it 'gives you a hint for one of the missing classes' do
      input = 'Priest Paladin Bard'
      expected = /Heres a hint for a missing class:/
      allow($stdin).to receive(:gets).and_return(input, 'quit')
      expect { play }.to output(expected).to_stdout
    end

    describe 'after entering partially correct and retrying' do
      it 'tells you what is correct so far and the number of missing classes' do
        input = 'Priest Paladin bard'
        input2 = 'Monk'
        expected = /You have the following classes correct: monk priest paladin. You are missing 8 classes/
        allow($stdin).to receive(:gets).and_return(input, input2, 'quit')
        expect { play }.to output(expected).to_stdout
      end
    end
  end
end
