class MandrillEvent
  attr_reader :from_email, :from_name, :to_email, :to_name, :html_value, :text_value

  def initialize(event)
    @from_email = event['msg']['from_email']
    @from_name =  event['msg']['from_name']
    @to_email =   event['msg']['email']
    @to_name =    event['msg']['to'].last.last
    @html_value = event['msg']['html']
    @text_value = event['msg']['text']
  end
end
