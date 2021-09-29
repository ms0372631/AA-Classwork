require 'rspec'
require "first_tdd_projects"

describe "my_uniq" do
    it "should accept an array as an arg" do
        expect {my_uniq([1,2,1,3,3]) }.to_not raise_error
    end

    it "should return an array with unique elements" do 
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end

    it "should implement the method #uniq" do
        arr_1 = [1,2,1,3,3]
        expect(arr_1).to receive(:uniq)
        my_uniq(arr_1)
    end
end

describe "Array#two_sum" do 
    it "finds indices of two elements that sum to zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]]) 
    end

    it "sorts each of the pairs from small to big indices" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([-1, 0, 2, -2, 1].two_sum.sort) 
    end
end

describe "my_transpose" do 

    grid1 = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    ans1 = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]

    it "should accept a 2D array as an arg" do
        expect { my_transpose(grid1) }.to_not raise_error
    end

    it "should transpose to column" do
        expect(my_transpose(grid1)).to eq(ans1)
    end

end

describe "stock_picker" do
    stock_prices = [10, 12, 15, 1, 50, 12]

    it "should take an array of stock prices" do
        expect { stock_picker(stock_prices) }.to_not raise_error
    end

    it "should output the most profitable pair of days to buy and sell the stock" do
        expect(stock_picker(stock_prices)).to eq([3, 4])
    end

    it "days should follow in a linear timeline" do
        expect(stock_picker(stock_prices)[0]).to be < stock_picker(stock_prices)[1]
    end
end 



describe Game do
    subject(:game) { Game.new }

    describe "#initialize" do
        it "sets one array with blocks and two empty arrays representing the gameboard" do
            expect(game.board).to eq([[4, 3, 2, 1],[],[]])
        end

        it "accepts a player as an instance variable" do 
            expect(game.player).to eq("player")
        end

    describe "#move" do 
        next_move = [1, 2]
        it "should accept a number as an arg" do
            expect {game.move(1, next_move) }.to_not raise_error
        end

        
        it "can only take the last element of the array and add it to another array" do 
            # exepect(game.move).to receive(arr[0].last)
            # exepect(game.move).to receive(arr[1].last)
            # exepect(game.move).to receive(arr[2].last)
            game.board.any? {|tower| expect(game.move).to receive(tower.last)}
        end

        it "cannot place a larger block on top of a smaller block" do 
            expect { game.move(1, [1, 0]) }.to raise_error("can't make that move")
        end
    end

    end
end
 

