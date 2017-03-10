class UserMessenger < BaseMessenger


# 1er bouton
  def start_shower(facebook_id)
    message(to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "Tu as 5 minutes pour prendre ta douche",
            buttons:[
              {
                type:"postback",
                title:"Prêt ?",
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
            text: "clique sur terminer quand tu as fini",
            buttons:[
              {
                type:"postback",
                title:"Terminé",
                payload:"UPLOAD"
              }
            ]
          }
        }
      }
    )
  end
  def message_chrono(facebook_id)
    message(to: facebook_id,
      message: {
        text: "Déjà 5 secondes d'écoulées"
      }
    )
  end
  def message_chrono_two(facebook_id)
    message(to: facebook_id,
      message: {
        text: "Déjà 10 secondes d'écoulées"
      }
    )
  end
  def picture_upload(facebook_id)
        message(to: facebook_id,
      message: {
        text: "Prends une photo pour valider ta participation."
      }
    )
  end

  def thank_you(facebook_id)
    message(to: facebook_id,
      message: {
        attachment:{
          type:"template",
          payload:{
            template_type:"button",
            text: "Merci d'avoir particpé !",
            buttons:[
              {
                type:"postback",
                title:"Projet en cours",
                payload:"RUNNING_PROJECTS"
              },
              {
                type: 'web_url',
                title: 'Va voir ta photo sur le site',
                url: 'http://www.washin5challenge.com/'
              }
            ]
          }
        }
      }
    )
    message(to: facebook_id,
      message: {
        text: "Reviens quand tu veux et partage avec tes amis !"
        }
      )

    message(to: facebook_id,
      message: {
        text: "Tape ok pour revenir au menu"
      }
    )

  end


# 2eme bouton
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
      }
    )
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
