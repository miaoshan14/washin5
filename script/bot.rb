Facebook::Messenger::Thread.set({
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
}, access_token: ENV['ACCESS_TOKEN'])
