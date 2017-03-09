class UserMessenger < BaseMessenger

  def start_shower(facebook_id)
    message(to: facebook_id,
      message: {
        text: "tu as 5 minutes pour prendre ta douche"
      })
  end

  def start_project(facebook_id)
    message(to: facebook_id,
      message: {
        text: "project"
      })
  end

  def start_completed(facebook_id)
    message(to: facebook_id,
      message: {
        text: "project completed"
      })
  end


  def welcome(facebook_id)
    message(to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "Veux-tu partciper à un challenge ?",
            buttons:[
              {
                type:"postback",
                title:"Je participe",
                payload:"START_CHALLENGE"
              },
              {
                type:"postback",
                title:"Projets en cours",
                payload:"RUNNING_PROJECTS"
              },
              {
                type:"postback",
                title:"Projets en cours",
                payload:"PROJECTS_COMPLETED"
              }
            ]
          }
        }
      }
    )
  end



  def synchronize(facebook_id)
    messages(
      to: facebook_id,
      messages: [
        {
          attachment:{
            type:"image",
            payload:{
              url:"http://i.giphy.com/KP25BorZCUxUI.gif"
            }
          }
        },
        {
          text: "Bravo, tu peux maintenant participer à WashIn5 avec Messenger"
        }
      ]
    )
  end

end
