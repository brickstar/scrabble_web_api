class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :scores

  def game_id
    binding.pry
    object.id
  end

  def scores

  end
end
