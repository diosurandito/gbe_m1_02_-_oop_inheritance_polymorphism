require_relative 'person'
require_relative 'hero'
require_relative 'allies'
require_relative 'villain'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'

jin = Hero.new("Jin Sakai", 100, 50)
yuna = Allies.new("Yuna", 90, 45)
sensei = Allies.new("Sensei Ishikawa", 80, 60)
heroes = [jin, yuna, sensei]
allies = [heroes[1], heroes[2]]

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)
villains = [mongol_archer, mongol_spearman, mongol_swordsman]

actions = ["Attack an enemy", "Heal an ally"]

i=1
until (jin.die? || villains.empty?) do 
    puts "========== Turn #{i} =========="
    puts "\n"

    heroes.each do |hero|
        puts hero
    end
    puts "\n"
    villains.each do |villain|
        puts villain
    end
    puts "\n"

    puts "As Jin Sakai, what do you want to do this turn?"
    index = 1
    actions.each do |action|
        puts "#{index}. #{action}"
        index += 1
    end
    turn = gets.chomp.to_i
    case turn
    when 1
        puts "Which enemy you want to attack?"
        index = 1
        villains.each do |villain|
            puts "#{index}. #{villain.name}"
            index += 1
        end
        jins_enemy = gets.chomp.to_i
        if jins_enemy == 1 || jins_enemy == 2 || jins_enemy == 3
            jin.attack(villains[jins_enemy - 1])
            villains.each do |villain|
                villains.delete(villain) if villain.die? || villain.flee?
            end
            allies.each do |ally|
                ally.attack(villains[rand(villains.size)])
            end
            puts "\n"

            villains.each do |villain|
                villains.delete(villain) if villain.die? || villain.flee?
            end
            puts "\n"

            villains.each do |villain|
                villain.attack(heroes[rand(heroes.size)])
            end
            puts "\n"

            allies.each do |ally|
                allies.delete(ally) if ally.die?
            end
            puts "\n"
        else
            puts "Hayo masukkin angka yang benar yah~"
        end
    when 2
        puts "Which ally you want to heal?"
        index = 1
        allies.each do |ally|
            puts "#{index}. #{ally.name}"
            index += 1
        end
        jins_ally = gets.chomp.to_i
        if jins_ally == 1 || jins_ally == 2
            jin.healing(allies[jins_ally - 1])
            allies.each do |ally|
                ally.attack(villains[rand(villains.size)])
            end
            puts "\n"

            villains.each do |villain|
                villains.delete(villain) if villain.die? || villain.flee?
            end
            puts "\n"

            villains.each do |villain|
                villain.attack(heroes[rand(heroes.size)])
            end
            puts "\n"

            allies.each do |ally|
                allies.delete(ally) if ally.die?
            end
            puts "\n"

        else
            puts "Hayo masukkin angka yang benar yah~" 
        end
    else  
        puts "Hayo masukkin angka yang benar yah~"    
    end 
    
    i += 1
end
