class Api::V1::PlayController < ApiBaseController
  def create
    game = Game.find(params[:id])
    game.plays.create(user_id: params[:user_id], word: params[:word])
  end
end
