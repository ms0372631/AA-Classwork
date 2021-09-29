class Dog
    attr_accessor :age
    attr_reader :name, :breed, :favorite_foods

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def bark
        if @age > 3
            return @bark.upcase
        end
        @bark.downcase
    end

    def favorite_food?(food)
        @favorite_foods.any? {|f| f.downcase == food.downcase} 
    end
end