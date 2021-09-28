class SessionsSerializer
  include FastJsonapi::ObjectSerializer
  
  def self.return_session(user_info)
    {
  data: {
    type: "users",
    id: user_info.id,
    attributes: {
      email: user_info.email,
      api_key: user_info.api_key
    }
  }
}
  end
end