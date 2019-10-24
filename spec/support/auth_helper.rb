# frozen_string_literal: true

helpers = Module.new do
  include ActionController::HttpAuthentication::Basic

  def http_login(username:, password:)
    request.env['HTTP_AUTHORIZATION'] = encode_credentials(username, password)
  end
end

RSpec.configure do |config|
  config.include helpers
end
