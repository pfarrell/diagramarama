$: << File.expand_path('../lib', __FILE__)
$: << File.expand_path('../app', __FILE__)

require 'sinatra'
require 'sinatra/url_for'
require 'sinatra/cookies'
require 'securerandom'
require 'haml'

class Diagramarama < Sinatra::Application
  helpers Sinatra::UrlForHelper
  helpers Sinatra::Cookies

  enable :sessions
  set :session_secret, ENV["APP_SESSION_SECRET"] || "youshouldreallychangethis"
  set :views, Proc.new { File.join(root, "app/views") }

  before do
    response.set_cookie(:appc, value: SecureRandom.uuid, expires: Time.now + 3600 * 24 * 365 * 10) if request.cookies["bmc"].nil?
  end
end

require 'editable'
require 'models'
require 'routes'
