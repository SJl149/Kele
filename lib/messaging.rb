module Messaging
  BASE_URI = "https://www.bloc.io/api/v1"

  def get_messages
    messages = "/message_threads"
    response = self.class.get(BASE_URI + messages, headers: { "authorization" => @auth_token })
    json_body = response.body
    JSON.parse(json_body)
  end

  def create_message(sender, recipient_id, stripped_text)
    message = '{
      "sender" => #{sender},
      "recipient_id" => #{recipient_id},
      "stripped_text" => #{stripped_text}
    }'
    response = self.class.get(BASE_URI + '/messages', message, headers: { "authorization" => @auth_token })
  end
end
