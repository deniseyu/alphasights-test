require './app/models/mailer'

describe Mailer do

  let(:mailer) { Mailer.new(recipients, from, subject, body) }
  let(:from) {"sender@test.com"}
  let(:recipients) {"yu.denise.d@gmail.com"}
  let(:subject) {"Hello"}
  let(:body) {"Hi"}

  it 'should be initialized with recipients, sender, subject, and body' do
    expect(mailer.recipients).to eq "yu.denise.d@gmail.com"
    expect(mailer.from).to eq "sender@test.com"
    expect(mailer.subject).to eq "Hello"
    expect(mailer.body).to eq "Hi"
  end

  it 'should send an email to yu.denise.d@gmail.com' do

    mg_client = instance_double(Mailgun::Client)
    allow(Mailgun::Client).to receive(:new).with("key-a88164d5295ed36792cb01e75ffef0c6").and_return mg_client
    message_params = {:from  => from,
                    :to      => recipients,
                    :subject => subject,
                    :text    => body}
    expect(mg_client).to receive(:send_message).with("sandbox147ff18ab35e48b28c499ac32b634ce2.mailgun.org", message_params)
    mailer.send_email
  end

  it 'should validate that all fields are filled out' do
    expect{ mailer = Mailer.new("hello@test.com", "sender@test.com", "Subject", "") }.to raise_error 'All fields must be filled out'
  end

end