class Individual < ActiveRecord::Base
  has_one :user, :as => :details

  accepts_nested_attributes_for :user
  attr_accessible :user_attributes, :familyincome, :gpa, :hobbies, :major, :firstname, :lastname, :college, :testscores, :birthday, :gender, :futurehopesanddreams, :goalinlife, :academiclevel, :academicyear, :highschool, :highschoolgpa, :satscore, :satverbalscore, :satmathscore, :actscore, :actmathscore, :ap, :mathclass, :proficiencymath, :proficiencyreading, :proficiencyscience, :proficiencysocialstudies,
  :proficiencybusiness,
  :proficiencyeconomics,
  :proficiencymusic,
  :proficiencyforeignlanguage,
  :proficiencysports,
  :proficiencycommunityservice,
  :proficiencypublicspeaking,
  :proficiencyleadership,
  :proficiencydance,
  :proficiencyart,
  :proficiencyacting,
  :foreignlanguage,
  :favoritecolor,
  :weburl
end
