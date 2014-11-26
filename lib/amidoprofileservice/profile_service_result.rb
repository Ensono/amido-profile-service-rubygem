require 'httparty/response'
class ProfileServiceResult
  attr_reader :body, :status_code, :code

  def initialize(httparty_response)
    set_code httparty_response
    set_body httparty_response
  end

  private

  def set_body(res)
    @body = res.parsed_response
  end

  def set_code(res)
    @status_code = res.code

    case res.code
      when 200..299 then @code = :OK
      when 300..399 then @code = :REDIRECT
      when 400..499 then @code = :CLIENT_ERROR
      when 500..599 then @code = :SERVER_ERROR
      else @code = :UNKNOWN_ERROR
    end
  end
end