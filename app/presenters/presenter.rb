class Presenter
  attr_reader :word, :conn
  def initialize(params)
    @word = params[:search]
  end

  def root_word
    binding.pry

  end


  def conn
    @conn ||= Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1")
  end

  def response
    conn =  Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1")
    conn.get |req| do
      req.url("inflections/en/#{word}")
      req.headers['Content-Type'] = 'application/json'
      req.headers['app_id'] = 'cb7a6cb9'
      req.headers['app_key'] = '30b83590a6facfe5506d0f7619293dc5'
    end
  end
end
