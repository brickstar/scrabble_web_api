class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    binding.pry
    object.id
  end

  def scores
    "scores": [
      {
        "user_id": object.player_1.id,
        "score": object.player_1.plays.map { |play| play.score }.sum
      },
      {
        "user_id": object.player_2.id,
        "score": object.player_2.plays.map { |play| play.score }.sum
      }
    ]
  end
end
