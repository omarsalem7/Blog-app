class JsonWebToken
  def self.decode(token)
    JWT.decode(token, 'OMAR')[0]
  end
end
