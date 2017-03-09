require 'facebook/messenger'

include Facebook::Messenger

Bot.on :message do |message|
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]
  facebook_id = message.sender['id']

  user = User.find_for_messenger(facebook_id)

  if message.attachments
    participation = Participation.new
    participation.project = Project.last
    participation.user = user
    participation.participation_picture_urls =  [ message.attachments.first['payload']['url'] ]
    partipation.save
  end

  UserMessenger.welcome(facebook_id).deliver_now
end


Bot.on :postback do |postback|
  postback.sender    # => { 'id' => '1008372609250235' }
  postback.recipient # => { 'id' => '2015573629214912' }
  postback.sent_at   # => 2016-04-22 21:30:36 +0200
  postback.payload   # => 'EXTERMINATE'

  facebook_id = postback.sender['id']
  user = User.find_for_messenger(facebook_id)

  if postback.payload == 'START_CHALLENGE'
    UserMessenger.start_shower(facebook_id).deliver_now
  end
  if postback.payload == 'START_CHRONO'
    UserMessenger.start_chrono(facebook_id).deliver_now
    sleep 5
    UserMessenger.message_chrono(facebook_id).deliver_now
  end
  if postback.payload == 'UPLOAD'
    UserMessenger.picture_upload(facebook_id).deliver_now

  end



  if postback.payload == 'RUNNING_PROJECTS'
    UserMessenger.start_project(facebook_id).deliver_now
  end

  if postback.payload == 'PROJECTS_COMPLETED'
    UserMessenger.start_completed(facebook_id).deliver_now
  end

end

Bot.on :optin do |optin|
  optin.sender    # => { 'id' => '1008372609250235' }
  optin.recipient # => { 'id' => '2015573629214912' }
  optin.sent_at   # => 2016-04-22 21:30:36 +0200
  optin.ref       # => 'CONTACT_SKYNET'
  facebook_id = optin.sender['id']

  user = User.find(optin.ref)
  user.update_attribute(:facebook_id, facebook_id)
  UserMessenger.synchronize(facebook_id).deliver_now
end

