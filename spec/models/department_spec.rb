require 'spec_helper'

describe Department do
  
  describe "associations" do
    before do
      @department = Factory.create(:department)
      @section1 = Factory.create(:section)
      @section2 = Factory.create(:section)
      @department.sections << @section1
      @department.sections << @section2

      @guest1 =  Factory.build(:guest_free)
      @guest2 =  Factory.build(:guest_free)
      @department.guests << @guest1
      @department.guests << @guest2
      @guest1.save
      @guest2.save
    end

    it "has many sections" do 
      @department.sections.size.should == 2
    end

    it "has many guests" do 
      @department.guests.size.should == 2
    end

    it "has many active guests" do
      @department.active_guests.size.should == 2
    end

    it "finish guest" do
      @guest1.finish = true
      @guest1.save
      @department.active_guests.size.should == 1
    end

    it "pass guest" do
      @guest1.pass = true
      @guest1.save
      @department.active_guests.size.should == 1
    end

    it "logical delete" do
      @guest1.destroy
      @department.guests.size.should == 1
      @department.active_guests.size.should == 1
    end
  end

end
