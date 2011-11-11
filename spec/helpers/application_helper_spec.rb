# -*- coding: utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do
  
  describe "num_to_soundparts" do
    
    it "1は['1']になるべき" do
      num_to_soundparts(1).should == ['1']
    end

    it "5は['5']になるべき" do
      num_to_soundparts(5).should == ['5']
    end

    it "10は['10']になるべき" do
      num_to_soundparts(10).should == ['10']
    end

    it "11は['10','1']になるべき" do
      num_to_soundparts(11).should == ['10','1']
    end

    it "13は['10','3']になるべき" do
      num_to_soundparts(13).should == ['10','3']
    end

    it "100は['100']になるべき" do
      num_to_soundparts(100).should == ['100']
    end

    it "101は['100','1']になるべき" do
      num_to_soundparts(101).should == ['100','1']
    end

    it "108は['100','8']になるべき" do
      num_to_soundparts(108).should == ['100','8']
    end

    it "110は['100','10']になるべき" do
      num_to_soundparts(110).should == ['100','10']
    end

    it "150は['100','5','10']になるべき" do
      num_to_soundparts(150).should == ['100','5','10']
    end

    it "163は['100','6','10','3']になるべき" do
      num_to_soundparts(163).should == ['100','6','10','3']
    end

    it "245は['2','100','4','10','5']になるべき" do
      num_to_soundparts(245).should == ['2','100','4','10','5']
    end

    it "300は['3','100']になるべき" do
      num_to_soundparts(300).should == ['3','100']
    end

  end

  describe "all_sound_parts" do
    it "300と内科は['3','100','bannokataha','naika','noshinsatsushitsuhe']となるべき" do

      all_sound_parts(300,'内科').should == ['3','100','bannokataha','naika','noshinsatsushitsuhe']
    end

  end

end
