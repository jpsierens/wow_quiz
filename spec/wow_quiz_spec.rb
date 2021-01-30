require "./wow_quiz.rb"

classesInput = ['Priest', 'Paladin', 'Monk', 'DemonHunter', 'DeathKnight', 'Shaman', 'Mage', 'Warlock', 'Hunter', 'Rogue', 'Druid']

describe "wow quiz" do
    describe "enters all correct classes" do
        it "passes the quiz" do
            expect(is_correct(classesInput)).to eq true
        end
    end

    describe "enters everything wrong" do
        it "fails the quiz" do
            answer = ["Bard", "SpellBreaker", "Necromancer"]
            expect(is_correct(answer)).to eq false
        end
    end

    describe "enters partially correct" do
        it "fails the quiz and tells you what is correct" do
            answer = ["Priest", "Paladin", "Bard"]
            expected_string = "You have the following classes correct: Priest Paladin. Retype them and the missing ones"
            expect(is_correct(answer)).to eq false
            expect(handle_wrong_answer(answer)).to eq(expected_string) 
        end
    end
end
