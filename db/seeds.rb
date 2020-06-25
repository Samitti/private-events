# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  {
    name: 'Michael'
  },
  {
    name: 'Joshua'
  },
  {
    name: 'Luke'
  },
  {
    name: 'Mark'
  },
  {
    name: 'Mathew'
  },
  {
    name: 'James'
  },
  {
    name: 'Peter'
  },
  {
    name: 'John'
  }
])



user1 = User.find_by(name: 'John')
user1.events.create!({
                        name: 'BugSmash',
                        location: 'Wynkoop in LoDo, Denver, CO',
                        starts_at: 10.days.from_now,
                        description: %{
                          Join us for a fun evening of bug smashing! It's a great
                          way to get involved in open source projects whether you're
                          reporting bugs, fixing bugs, or even inadvertently creating
                          a few bugs!
                        }
})
