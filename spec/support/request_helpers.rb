module RequestHelpers
  extend ActiveSupport::Concern

  included do
    let(:default_env) do
      username = 'test'
      password = Settings.auth_token

      {
        'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
      }
    end
    let(:env) { default_env }
  end

  def get(*args)
    args[2] ||= env
    super(*args)
  end

  def post(*args)
    args[2] ||= env
    super(*args)
  end

  def put(*args)
    args[2] ||= env
    super(*args)
  end

  def delete(*args)
    args[2] ||= env
    super(*args)
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request
end