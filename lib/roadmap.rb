module Roadmap
  BASE_URI = "https://www.bloc.io/api/v1"
  
  def get_roadmap(roadmap_id)
    roadmap = "/roadmaps/#{roadmap_id}"
    response = self.class.get(BASE_URI + roadmap, headers: { "authorization" => @auth_token})
    json_body = response.body
    JSON.parse(json_body)
  end
  
  def get_checkpoint(checkpoint_id)
    checkpoint = "/checkpoints/#{checkpoint_id}"
    response = self.class.get(BASE_URI + checkpoint, headers: { "authorization" => @auth_token})
    json_body = response.body
    JSON.parse(json_body)
  end
end