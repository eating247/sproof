FactoryGirl.define do 
  factory :movie do
    title "Memento"
    storyline "dude can't remember things"
    release { Date.parse("2001-01-19") }
    link "http://www.imdb.com/title/tt0209144/"
    association :genre, factory: :genre
  end
end
