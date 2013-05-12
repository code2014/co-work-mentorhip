class Company < ActiveRecord::Base
  has_one :user, :as => :details
  attr_accessible :name, :user_attributes
  accepts_nested_attributes_for :user
  attr_accessible :user_attributes, :weburl
end
