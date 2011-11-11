class Section < ActiveRecord::Base

  belongs_to :department
  has_one :guest

  def full_name
    if name
      return "#{department.name} #{name}"
    else
      return "#{department.name}"
    end
  end
  
end
