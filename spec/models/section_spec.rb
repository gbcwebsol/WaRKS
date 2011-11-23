# -*- coding: utf-8 -*-
require 'spec_helper'

describe Section do

  before do
    @department = FactoryGirl.create(:department)      
    @section = FactoryGirl.create(:section)      
    @department.sections << @section
  end

  describe "名前を持つsection" do
    it do
      @section.full_name.should == "#{@department.name} #{@section.name}"
    end
  end

  describe "名前を持たないsection" do
    before do
      @section.name = nil
      @section.save
    end

    it do 
      @section.full_name.should == @department.name
    end
  end

end
