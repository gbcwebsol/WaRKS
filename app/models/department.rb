class Department < ActiveRecord::Base
  has_many :guests
  has_many :sections
  has_many :active_guests, :conditions => {:finish => false, :pass => false, :section_id => nil}, :class_name => "Guest"
  has_many :pass_guests, :conditions => {:finish => false, :pass => true}, :class_name => "Guest"

  def self.create_with_section(*args)
    d = self.create(*args)
    d.sections << Section.create
    return d
  end

  def yobidashi( guest)
    sections.first.guest = guest
  end

end
