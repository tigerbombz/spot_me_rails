require 'rubygems'
require 'twilio-ruby'

account_sid = "ACb282281e8fd32a95cc4adb23b4de598a"
auth_token = "84d220a902f45e8d6802b7ffa3384136"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+14084448495"

friends = {
  "+14084600029" => "Tiggy Pop"
}

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, See you tomorrow morning around 730am kook.",
    :media_url => "https://demo.twilio.com/owl.png"
    )
  puts "Sent message to #{value}"
end
