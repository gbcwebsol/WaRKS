class Count < ActiveRecord::Base

  def self.count
    today.value    
  end

  def self.count_up
    data = today
    was = data.value
    data.value = was + 1
    data.save
 
    was
  end

  def self.today
    t = self.where(:date => Date.today).first
    t = self.create(:date => Date.today) unless t
    t
  end

end
