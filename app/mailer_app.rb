require 'sinatra/base'
require_relative 'models/mailer'
require_relative 'models/parser'

class MailerApp < Sinatra::Base
  set :views, Proc.new{File.join(root, '..', "app", "views")}

  get '/' do
    erb :index
  end

  post '/confirm_email' do
    begin
      mailer = Mailer.new(params[:Recipients],
                        params[:From],
                        params[:Subject],
                        params[:Body])
      @mailer = mailer
      parser = Parser.new
      @parsed_message = parser.markdown_to_HTML(@mailer.body)
      erb :confirmation
    rescue RuntimeError
      erb :error
    end
  end

  post '/send_email' do
    mailer = Mailer.new(params[:Recipients],
                        params[:From],
                        params[:Subject],
                        params[:Body])
    mailer.send_email
    redirect '/success'
  end

  get '/success' do
    erb :success
  end

end