class Guest < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :section
  belongs_to :department

  validates :department_id, :presence => true
  validates :uid, :presence => true

end
