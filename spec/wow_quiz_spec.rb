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
            expect(is_correct(CLASSES)).to eq true
        end
    end

    describe "enters everything wrong" do
        it "fails the quiz" do
            input = "Bard SpellBreaker Necromancer"
            answer = format_input(input)
            expect(is_correct(answer)).to eq false
        end
    end

    describe "enters partially correct" do
        it "fails the quiz and tells you what is correct" do
            input = "Priest Paladin Bard"
            expected_string = "You have the following classes correct: priest paladin. Retype them and the missing ones"
            answer = format_input(input)
            expect(is_correct(answer)).to eq false
            expect(handle_wrong_answer(answer)).to eq(expected_string) 
        end
    end

    describe "enters correct classes but with different casing" do
        it "passes the test since we dont care about casing" do
            classes = CLASSES.clone
            # push to the array so we dont have to write all the classes here, it will get downcased and uniq'd later
            # so if we do have the same word, it will end up with the correct array of classes (e.g. pRiEst => priest)
            input = classes.push("pRiEst").join(" ")

            answer = format_input(input)
            expect(is_correct(answer)).to eq true
        end
    end
end
