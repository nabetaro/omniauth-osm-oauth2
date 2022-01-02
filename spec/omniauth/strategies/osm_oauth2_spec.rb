# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OmniAuth::Strategies::OsmOauth2 do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:app) do
    lambda do
      [200, {}, ['Hello.']]
    end
  end

  let(:appid) { 'appid' }
  let(:secret) { 'secret' }

  let(:options) { {} }

  subject do
    OmniAuth::Strategies::OsmOauth2.new(app, appid, secret, options || {}).tap do |strategy|
      allow(strategy).to receive(:request) do
        request
      end
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe '#client_options' do
    it 'has correct site' do
      expect(subject.client.site).to eq('https://www.openstreetmap.org')
    end

    it 'has correct authorize_url' do
      expect(subject.client.options[:authorize_url]).to eq('/oauth2/authorize')
    end

    it 'has correct token_url' do
      expect(subject.client.options[:token_url]).to eq('/oauth2/token')
    end

    describe 'overrides' do
      context 'as strings' do
        let(:options) do
          {
            :client_options => {
              'site' => 'https://example.com',
              'authorize_url' => 'https://example.com',
              'token_url' => 'https://example.com'
            }
          }
        end

        it 'should allow overriding the site' do
          expect(subject.client.site).to eq('https://example.com')
        end

        it 'should allow overriding the authorize_url' do
          expect(subject.client.options[:authorize_url]).to eq('https://example.com')
        end

        it 'should allow overriding the token_url' do
          expect(subject.client.options[:token_url]).to eq('https://example.com')
        end
      end

      context 'as symbols' do
        let(:options) do
          {
            :client_options => {
              :site => 'https://example.com',
              :authorize_url => 'https://example.com',
              :token_url => 'https://example.com'
            }
          }
        end

        it 'should allow overriding the site' do
          expect(subject.client.site).to eq('https://example.com')
        end

        it 'should allow overriding the authorize_url' do
          expect(subject.client.options[:authorize_url]).to eq('https://example.com')
        end

        it 'should allow overriding the token_url' do
          expect(subject.client.options[:token_url]).to eq('https://example.com')
        end
      end
    end
  end
end
