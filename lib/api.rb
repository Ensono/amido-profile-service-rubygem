require 'json'
require 'net/http'

class Api
  def self.post(uri, profile)
    req = Net::HTTP::Post.new(uri, { :'Content-Type' => 'application/json' })
    req.body = profile.to_json

    res = Net::HTTP.new()
  end
end