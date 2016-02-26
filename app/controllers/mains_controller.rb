require 'json'
require 'net/http'
require 'open-uri'

class MainsController < ApplicationController
  TOKEN = 'c140a1d9df830f3f62ec7c0424ba372c97dfa466'
  $workout_uri = "https://wger.de/api/v2/exercise/?language=2"
  # before_action :authenticate

  def get_api
    response = open($workout_uri)
    # uri = URI.parse($workout_uri)
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use.ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # request = NET::HTTP::Get.new(uri.request_uri)
    # response = http.request(request)
    # data = response.body
    @workout = JSON.load(response)
    render :text => @workout
  end

  private
  # def authenticate
  #   authenticate do |token, options|
  #     token = TOKEN
  #   end
  # end
end
