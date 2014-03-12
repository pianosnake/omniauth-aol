require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Aol < OmniAuth::Strategies::OAuth2
      option :name, 'aol'

      option :client_options, {
        :site => 'https://api.screenname.aol.com',
        :authorize_url => 'https://api.screenname.aol.com/auth/authorize',
        :token_url => 'https://api.screenname.aol.com/auth/access_token',
      }

      uid{ raw_info['response']['data']['userData']['loginId'] }

      info do
        {
            :email => raw_info['response']['data']['userData']['attributes']['email'],
            :display_name => raw_info['response']['data']['userData']['displayName'],
            :login_id => raw_info['response']['data']['userData']['loginId'],
            :last_auth => raw_info['response']['data']['userData']['lastAuth']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/auth/getUserDataInternal?attribute=email&f=json').parsed
      end
    end
  end
end