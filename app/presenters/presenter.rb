class Presenter
  attr_reader :word
  def initialize(params)
    @word = params[:search]
  end

  def word_response
    if response.body.include?("404")
      "'#{word}' is not a valid word."
    else
      "'#{word}' is a valid word and its root form is #{get_root_word}'"
    end
  end

  def get_root_word
    get_json[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    conn.get do |req|
      req.url("inflections/en/#{word}")
      req.headers['Content-Type'] = 'application/json'
      req.headers['app_id'] = 'cb7a6cb9'
      req.headers['app_key'] = '30b83590a6facfe5506d0f7619293dc5'
    end
  end
end
