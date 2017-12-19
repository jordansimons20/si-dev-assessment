class PagesController < ApplicationController
  require 'twilio-ruby'
  def home
  end

  def sms
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.messages.create(
    body: params[:message],
    to: params[:phone_number], # User Phone Number
    from: ENV['TWILIO_FROM_NUMBER']) # Twilio Number
  end
end
