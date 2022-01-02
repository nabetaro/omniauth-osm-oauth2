# frozen_string_literal: true

require 'omniauth-oauth2'
require 'rexml/document'

module OmniAuth
  module Strategies
    class OsmOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'osm_oauth2'

      def self.site
        ENV['OSM_AUTH_SITE'] || 'https://www.openstreetmap.org'
      end

      option :client_options,
             :site => site,
             :authorize_url => '/oauth2/authorize',
             :token_url => '/oauth2/token'
      option :fetch_permissions, false
      option :scope, %i[read_prefs]


      # You may specify that your strategy should use PKCE by setting
      # the pkce option to true: https://tools.ietf.org/html/rfc7636
      option :pkce, true

      def authorize_params
        super.tap do |params|
          params[:scope] = options[:scope].split(',').join(' ')
        end
      end

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['display_name'],
          :image => raw_info['image_url']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= parse_details(access_token.get('/api/0.6/user/details').body)
        @raw_info['permissions'] ||= parse_permissions(access_token.get('/api/0.6/permissions').body) if options[:fetch_permissions]
        @raw_info
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    private

      def parse_details(xml_data)
        # extract event information
        doc = REXML::Document.new(xml_data)
        user = doc.elements['//user']
        home = doc.elements['//home']
        languages = doc.get_elements('//lang')
        image = doc.elements['//img']
        description = doc.elements['//description']
        basic_attributes = {}
        if user
          basic_attributes['id']           = user.attribute('id').value
          basic_attributes['display_name'] = user.attribute('display_name').value
        end
        basic_attributes['languages']    = languages.map(&:text) if languages
        basic_attributes['image_url']    = image.attribute('href').value if image
        if home
          basic_attributes['lat']          = home.attribute('lat').value.to_f
          basic_attributes['lon']          = home.attribute('lon').value.to_f
        end
        basic_attributes['description']  = description.text if description
        basic_attributes
      end

      def parse_permissions(xml_data)
        # extract event information
        doc = REXML::Document.new(xml_data)
        doc.get_elements('//permission').map { |p| p.attribute('name').value }
      end
    end
  end
end
