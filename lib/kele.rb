class Kele
  include HTTParty

  def initialize(username, password)
    base_uri = "https://www.bloc.io/api/v1/sessions"

    options = {
      body: {
        email: username,
        password: password
      },
      header: {
        :content_type => 'application/json'
      }
    }

    response = self.class.post(base_uri, options)
    @auth_token = response["auth_token"]
  end

end
