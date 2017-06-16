module Messaging
  BASE_URI = "https://www.bloc.io/api/v1"

  def get_messages(page = nil)
    messages = []
    if page == nil
      page = 1
      items = threads(page)
      count = items["count"]
      pages = (count / 10.0).ceil

      for x in 1..pages do
        page = x
        items = threads(page)
        items["items"].map { |item| messages << item }
      end

    else
      items = threads(page)
      items["items"].map { |item| messages << item }
    end
    messages
  end

  def create_message #(sender, recipient_id, stripped_text)
    print "Who is the sender? "
    sender = gets
    print "What is the recipient's id? "
    recipient_id = gets
    print "What would you like to say? "
    stripped_text = gets

    options = {
      body: {
        "sender" => sender,
        "recipient_id" => recipient_id,
        "stripped_text" => stripped_text
      },
      headers: {
        "authorization" => @auth_token
      }
    }
    response = self.class.post(BASE_URI + '/messages', options )

  end

  private

  def threads(page)
    options = {
      body: {
        "page" => "#{page}",
      },
      headers: {
        "authorization" => @auth_token
      }
    }
    response = self.class.get(BASE_URI + "/message_threads", options)
    json_body = response.body
    JSON.parse(json_body)
  end
  
end
