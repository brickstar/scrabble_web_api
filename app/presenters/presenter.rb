class Presenter
  attr_reader :word
  def initialize(params)
    @word = params[:search]
  end

  def root_word
    binding.pry
  end
end
