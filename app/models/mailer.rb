require 'mailgun'

class Mailer

  attr_reader :recipients, :from, :subject, :body

  def initialize(recipients, from, subject, body)
    raise 'All fields must be filled out' if [recipients, from, subject, body].any?{|field| field == ""}
    @recipients = recipients
    @from = from
    @subject = subject
    @body = body
  end

  def send_email
    mg_client = Mailgun::Client.new "key-a88164d5295ed36792cb01e75ffef0c6"
    message_params = {:from    => from,
                    :to      => recipients,
                    :subject => subject,
                    :text    => body}
    mg_client.send_message "sandbox147ff18ab35e48b28c499ac32b634ce2.mailgun.org", message_params
  end

end