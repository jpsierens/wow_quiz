require "./wow_quiz.rb"

classesInput = 'Priest Paladin Monk DemonHunter DeathKnight Shaman Mage Warlock Hunter Rogue Druid'

describe "wow quiz" do
    describe "enters all correct classes" do
        it "passes the quiz" do
            expect(evaluate_input classesInput).to be true
        end
    end

    describe "enters something wrong" do
        it "fails the quiz" do
            expect(evaluate_input 'Bard SpellBreaker Necromancer').to be false
        end
    end
end
