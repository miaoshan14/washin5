namespace :facebook do
  desc 'Update all'
  task update_all: :environment do
    # ThreadManager.update_greeting
    # ThreadManager.update_getting_started
    ThreadManager.update_menu
  end
end
