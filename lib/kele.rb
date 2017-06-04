class Kele
  include HTTParty
  BASE_URI = "https://www.bloc.io/api/v1/sessions"

  def initialize(username, password)
    options = {
      body: {
        email: username,
        password: password
      },
      header: {
        :content_type => 'application/json'
      }
    }

    response = self.class.post(BASE_URI, options)
    @auth_token = response["auth_token"]
  end

end
