require 'rails_helper'

describe 'user requests' do
  context 'get to /api/v1/games/:id' do
    it 'should receive appropriate JSON response' do
      game = create(:game)

      get "/api/v1/games/#{game.id}"

      expect(response.status).to eq(200)

      json = {"game_id"=>2, "scores"=>[{"user_id"=>4, "score"=>0}, {"user_id"=>5, "score"=>0}]}

      expect(JSON.parse(response.body)).to eq(json)
    end
  end

  context 'post to /api/v1/games/:id/plays' do
    it 'should receive appropriate JSON response' do
      game = create(:game)
      play = create(:play, word: "at")

      post "/api/v1/games/#{game.id}/plays"
binding.pry
      expect(response.status).to eq(201)
      #
      # json = {"game_id"=>2, "scores"=>[{"user_id"=>4, "score"=>0}, {"user_id"=>5, "score"=>0}]}
      #
      # expect(JSON.parse(response.body)).to eq(json)
    end
  end
end
