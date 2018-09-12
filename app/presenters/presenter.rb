class Presenter
  attr_reader :word
  def initialize(params)
    @word = params[:search]
    @service = OxfordService.new(params)
  end

  def word_response
    if @service.response.body.include?("404")
      "'#{word}' is not a valid word."
    else
      "'#{word}' is a valid word and its root form is #{get_root_word}'"
    end
  end

  def get_root_word
    @service.get_json[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]
  end
end
