class UserMessenger < BaseMessenger

  def start_shower(facebook_id)
    message(to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "tu as 5 minutes pour prendre ta douche",
            buttons:[
              {
                type:"postback",
                title:"Pret ?",
                payload:"START_CHRONO"
              }
            ]
          }
        }
      }
    )
  end

  def start_chrono(facebook_id)
    message(to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "tu as 5 minutes pour prendre ta douche",
            buttons:[
              {
                type:"postback",
                title:"Pret ?",
                payload:"START_CHRONO"
              }
            ]
          }
        }
      }
    )
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
    messages(
      to: facebook_id,
      messages: [
        {
          attachment:{
            type:"image",
            payload:{
              url:"http://www.washin5challenge.com/assets/logo-e09b626c392be755c3d3a0263ed9bf01f29b66b0251dd37661322264ef258237.png"
            }
          }
        }
      ]
    )
    message(
      to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "Wash in 5 Challenge projet d'accés à l'eau collaboratif. Veux-tu partciper à un challenge ?",
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
                title:"Projets réaliser",
                payload:"PROJECTS_COMPLETED"
              }
            ]

          }
        }
      }
    )

    message(
      to: facebook_id,
      message: {
          text: "Rejoins la communauté Wash in 5 !"
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
