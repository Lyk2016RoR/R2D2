# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c3=Category.create(name:"Category1")
c2=Category.create(name:"Category2")


a1=Author.create(firstName:"firstName1",lastName:"lastName1",description:"description1")
a2=Author.create(firstName:"firstName2",lastName:"lastName2",description:"description2")

Book.create(name:"Book1",pages:5,description:"Dexcrpadsad",category: c3,author: a1)
Book.create(name:"Book2",pages:5,description:"Dexcrpadsad",category: c2,author: a1)
Book.create(name:"Book3",pages:5,description:"Dexcrpadsad",category: c3,author: a2)


Vote.create(rating:1,book_id:1)