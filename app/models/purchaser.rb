class Purchaser < ActiveRecord::Base
  attr_accessible :user_attributes, :firstname, :lastname
  has_one :user, :as => :details
  accepts_nested_attributes_for :user
end
