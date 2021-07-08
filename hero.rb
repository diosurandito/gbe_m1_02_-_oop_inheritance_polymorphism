require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @deflect_percentage = 0.8
        @healing_skill = 20
    end

    def take_damage(damage)
        if rand < @deflect_percentage
            puts "#{@name} deflects the attack"
        else
            @hitpoint -= damage
        end
    end

    def healing(other_person)
        puts "#{@name} heals #{other_person.name}, restoring #{@healing_skill} hitpoints" 
        other_person.take_heal(@healing_skill)
    end
end