require "./wow_quiz.rb"
require "./classes.rb"

describe "wow quiz" do
    describe "input" do
        it "is formatted correctly" do
            input = "Priest Paladin"
            expect(format_input(input)).to eq ["priest","paladin"]
        end
    end

    describe "enters all correct classes" do
        it "passes the quiz" do
            allow($stdin).to receive(:gets).and_return(CLASSES.join(" "))
            
            # by expecting a /value/ you are testing that the value you passed is included in the stdout.
            # Passing 'value' fails since it expects the whole stdout output to match
            expect { play }.to output(/Correct!! Thanks for playing/).to_stdout
        end
    end

    describe "enters everything wrong" do
        it "tells you what's wrong" do
            input = "Bard SpellBreaker Necromancer"
            # receives the var
            # input for the first run of the loop, and 'quit' for the second
            allow($stdin).to receive(:gets).and_return(input, 'quit')
            expect { play }.to output(/The following classes are wrong: bard spellbreaker necromancer/).to_stdout
        end
    end

    describe "enters partially correct" do
        it "tells you what is correct and what is wrong" do
            input = "Priest Paladin Bard"
            expected_correct = /You have the following classes correct: priest paladin. Retype them and the missing ones/
            expected_wrong = /The following classes are wrong: bard/
            allow($stdin).to receive(:gets).and_return(input, 'quit')
            expect { play }.to output(Regexp.union(expected_correct, expected_wrong)).to_stdout
        end
    end

    describe "enters correct classes but with different casing" do
        it "passes the test since we dont care about casing" do
            classes = CLASSES.clone
            # push to the array so we dont have to write all the classes here, it will get downcased and uniq'd later
            # so if we do have the same word, it will end up with the correct array of classes (e.g. pRiEst => priest)
            input = classes.push("pRiEst").join(" ")
            allow($stdin).to receive(:gets).and_return(input)
            expect { play }.to output(/Correct!! Thanks for playing/).to_stdout
        end
    end
end
