require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Aol < OmniAuth::Strategies::OAuth2
      option :name, 'aol'

      option :client_options, {
        :site => 'https://www.aol.com',
        :authorize_url => 'https://api.screenname.aol.com/auth/authorize',
        :token_url => 'https://api.screenname.aol.com/auth/access_token',
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
            :name => raw_info['name'],
            :email => raw_info['email']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end