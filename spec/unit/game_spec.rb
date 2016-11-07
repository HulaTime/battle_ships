require 'game'

describe Game do

	subject(:game) { described_class.new(player_1) }
	subject(:multi_game) { described_class.new(player_1, player_2) }
	
	let(:player_1) { double :player_1, name: 'Max'}
	let(:player_2) { double :player_2, name: 'Miles'}


	context 'Initialization' do
		it 'A new game can be created with 1 player' do
			expect(Game).to respond_to(:new).with(1).argument
			expect(game.player_2).to eq false
		end

		it 'A new game can be created with 2 players' do
			expect(Game).to respond_to(:new).with(2).arguments
		end
	end

	context 'Moves' do
		before do
			allow(Kernel).to receive(:rand) { 1 }
		end

		context 'Single Player Game:' do
			it 'Generates a random defense for player 2' do
				game.defense[:p2].each do |piece, locations|
					expect(locations.count).to eq 5 if piece == :b
					expect(locations.count).to eq 4 if piece == :c
					expect(locations.count).to eq 3 if piece == :s
					expect(locations.count).to eq 2 if piece == :d
				end
			end

			xit "None of player 2's pieces overlap" do
				game.defense[:p2].each do |piece, locations|
					game.defense[:p2].each do |piece2, locations2|
						unless piece == piece2
							locations2.each do |location|
								expect(locations).not_to include location
							end
						end
					end
				end
			end

			it "None of player 2's pieces are out of bounds" do
				game.defense[:p2].each do |piece, locations|
					locations.each do |location|
						expect(location[1..-1].to_i).to be < 11
						expect(location[1..-1].to_i).to be > 0
					end
				end
			end
		end

		context 'Two Player Game:' do
			it 'Does not auto-generate defense for player 2' do
				expect(multi_game.defense[:p2]).to eq({})
			end

			it 'Player 1 cannot attack twice in a row if two player game' do
				multi_game.attack('a1')
				expect(multi_game.attack_log[:p1]).to eq ["a1"]
				multi_game.attack('a2')
				expect(multi_game.attack_log[:p1]).to eq ["a1"]
				expect(multi_game.attack_log[:p2]).to eq ["a2"]
			end

			it 'Player Hits are recorded' do
				2.times {	multi_game.set_defense('a1', 'a5', 'b') }
				2.times { multi_game.attack('a1') }
				expect(multi_game.hits('p1')).to eq ['a1']
				expect(multi_game.hits('p2')).to eq ['a1']
			end

			it 'Player Misses are recorded' do
				2.times {	multi_game.set_defense('a1', 'a5', 'b') }
				2.times { multi_game.attack('b1') }
				expect(multi_game.misses('p2')).to eq ['b1']
				expect(multi_game.misses('p1')).to eq ['b1']
			end
		end

		context 'Single or Two Player:' do
			it 'Player can attack' do
				game.attack('a1')
				expect(game.attack_log[:p1]).to eq ['a1']
			end

			it 'Player can set their defensive positions' do
				game.set_defense('a1', 'a5', 'b')
				expect(game.defense[:p1][:b]).to eq ['a1', 'a2', 'a3', 'a4', 'a5']
			end
		end
	end

	context 'Errors' do
		before do
			allow(Kernel).to receive(:rand) { 1 }
		end

		it 'Player cannot attack out of bounds' do
			expect(game.attack('a11')).to eq "Error: Out of bounds"
			expect(game.attack('a-1')).to eq "Error: Out of bounds"
		end

		it 'Player cannot place a defensive piece out of bounds' do
			expect(game.set_defense('j1', 'k1', 'd')).to eq "Error: Out of bounds"
			expect(game.set_defense('a-1', 'a3', 'b')).to eq "Error: Out of bounds"
		end

		it 'Player cannot attack or place a piece if it overlaps' do
			game.attack('a1')
			expect(game.attack('a1')).to eq "Error: Placement overlaps"
			game.set_defense('a1', 'a5', 'b')
			expect(game.set_defense('a1', 'a5', 'b')).to eq "Error: Placement overlaps"
		end
	end
end