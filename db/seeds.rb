# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
Participation.destroy_all
User.destroy_all

projects = Project.create!( [ {name: "Filtre à eau", description: "Fournir de l'eau potable à l'école", location: "Asharympathy", pictures_goal: 100, project_picture: "", current: true, done: false, future: false, impact: 30},
                      {name: "Forage", description: "Fournir de l'eau potable au village", location: "Theni", pictures_goal: 1000, project_picture: "", current: false, done: false, future: true, impact: 700},
                      {name: "Filtre à eau", description: "Fournir de l'eau potable à l'école", location: "Asharympathy", pictures_goal: 100, project_picture: "", current: false, done: true, future: false, impact: 30},
                      {name: "Filtre à eau", description: "Fournir de l'eau potable à l'école", location: "Asharympathy", pictures_goal: 100, project_picture: "", current: false, done: true, future: false, impact: 30}
                      ] )


# has_attachement :photos  (many)
urls = [
  'http://img.clubic.com/08254724-photo-xbox-console.jpg',
  'https://www.google.fr/search?q=filtre+eau+potable&espv=2&biw=1855&bih=966&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiI8OHLmLrSAhVEFSwKHdqfDZQQ_AUIBygC#'
]

participation = Participation.new
participation.save!
#participation.participation_pictures = urls # Multi-upload happens here
