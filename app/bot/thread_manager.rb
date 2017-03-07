# MAX 5 CTA
class ThreadManager

  # Sur la page de présentation de WashIn5
  def self.update_greeting
    val = Facebook::Messenger::Thread.set(
      {
        setting_type: 'greeting',
        greeting: {
          text: 'Bonjour {{user_first_name}}, finance des projets d\'accès à l\'eau avec Washin5'
        }
      },  access_token: ENV['ACCESS_TOKEN']
    )
    puts 'Greeting has been updated ' if val
    val
  end

  def self.update_menu
    val = Facebook::Messenger::Thread.set(
      {
        setting_type: 'call_to_actions',
        thread_state: 'existing_thread',
        call_to_actions: [
          {
            type: 'postback',
            title: 'Je participe',
            payload: 'JOIN_PROJECT'
          },
          {
            type: 'postback',
            title: 'Projets en cours',
            payload: 'RUNNING_PROJECTS'
          },
          {
            type: 'web_url',
            title: 'Voir le site',
            url: 'http://washin5.com/'
          }
        ]
      }, access_token: ENV['ACCESS_TOKEN']
    )
    puts 'Call to actions have been updated ' if val
    val
  end

  # Les personnes cliques sur démarrer
  def self.update_getting_started
    val = Facebook::Messenger::Thread.set(
      {
        setting_type: 'call_to_actions',
        thread_state: 'new_thread',
        call_to_actions: [
          {
            payload: 'GET_STARTED'
          }
        ]
      },  access_token: ENV['ACCESS_TOKEN']
    )
    puts 'Welcome has been updated ' if val
    val
  end

end
