require 'spec_helper'

describe Guest do

  describe "logical delete" do
    before do 
      @guest1 =  FactoryGirl.create(:guest)
      @guest2 =  FactoryGirl.create(:guest)
    end

    it do
      Guest.all.size.should == 2
      Guest.with_deleted.size.should == 2

      @guest1.destroy

      Guest.all.size.should == 1
      Guest.with_deleted.size.should == 2
    end
  end

end
