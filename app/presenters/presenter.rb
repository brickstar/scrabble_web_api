class Presenter
  def initialize(params)
    @param_word = params[:search]
  end

  def word
    binding.pry
  end

  def root_word
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
