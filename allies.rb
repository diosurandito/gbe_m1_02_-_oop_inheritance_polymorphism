require_relative 'person'

class Allies < Person
    def take_heal(heal)
        @hitpoint += heal
    end
end