# -*- coding: utf-8 -*-
require 'spec_helper'

describe Count do

  it "初期値は1" do
    Count.count.should == 1
  end

  it "count_upで値が増加する" do
    Count.count_up.should == 1
    Count.count_up.should == 2
    Count.count_up.should == 3
    Count.count.should == 4
  end

end
