require 'json'
require 'httparty'
require './lib/roadmap'
require './lib/checkpoint'

class Kele
  include HTTParty
  include JSON
  include Roadmap
  include Checkpoint

  BASE_URI = "https://www.bloc.io/api/v1"

  def initialize(username, password)
    options = {
      body: {
        email: username,
        password: password
      },
      header: {
        content_type: 'application/json'
      }
    }

    response = self.class.post(BASE_URI + "/sessions", options)
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(BASE_URI + "/users/me", headers: { "authorization" => @auth_token})
    json_body = response.body
    JSON.parse(json_body)
  end

  def get_mentor_availability(mentor_id)
    availability_uri = "/mentors/#{mentor_id}/student_availability"
    response = self.class.get(BASE_URI + availability_uri, headers: { "authorization" => @auth_token})
    json_body = response.body
    JSON.parse(json_body)
  end
end
