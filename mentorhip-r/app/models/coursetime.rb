class Coursetime < ActiveRecord::Base
  attr_accessible :course_id, :dayofweek, :end, :start, :course
  belongs_to :course

  validates_presence_of :start, :end, :dayofweek
end
