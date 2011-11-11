# -*- coding: utf-8 -*-
require 'spec_helper'

def guest
  Guest.create(                     
               :name => 'aaa bbb',
               :uid => '1234567',
               :accept_number => Count.count_up
               )
end

describe "Guest" do

  describe "GET /lobby", :type => :request do

    it do
      visit "/lobby"
      page.should have_content("外来待合状況")
    end
        
  end

  describe "GET /lobby/new", :type => :request do

    it do
      visit "/lobby/new"
      page.should have_content("受付入力")
    end
        
  end

  describe "POST /lobby/", :type => :request do

    before do    
      @d = Department.create!( :name => "内科" )                          
      @d.sections << (@s1 =  Section.create!( :name => "1" ))      
    end

    it "errorパターン" do
      visit "/lobby/new"
      # fill_in "guest[uid]", :with => "123456"
      # fill_in "guest[department_id]", :with => @d.id
      click_button "create"
      page.should have_content("受付入力")
    end
        
  end

  describe "GET /lobby/:id", :type => :request do

    before do    
      @d = Department.create!( :name => "内科" )                          
      @d.sections << (@s1 =  Section.create!( :name => "1" ))      
      @g = Guest.create(
        :uid => '123456',
        :department => @d
      )
    end

    it do
      visit "/lobby/#{@g.id}"
      page.should have_content("スマートフォンでこちらの受付完了画面")
    end

  end

  describe "GET /lobby/smartphone/:id", :type => :request do

    before do    
      @d = Department.create!( :name => "内科" )                          
      @d.sections << (@s1 =  Section.create!( :name => "1" ))      
      @g = Guest.create(
        :uid => '123456',
        :department => @d
      )
    end

    it do
      visit "/lobby/smartphone/#{@g.id}"
      page.should have_content("診察について")
    end

  end

  describe "GET /admin/section", :type => :request do

    before do    
      @d = Department.create!( :name => "内科" )                          
      @d.sections << (@s1 =  Section.create!( :name => "1" ))      
    end

    it "DBにある科の名前が表示されていること" do
      visit "/admin/section"
      page.should have_content(@s1.full_name)
    end
    
  end

  describe "GET /admin/section/:id", :type => :request do
    
    before do    
      @d = Department.create!( :name => "内科" )                          
      @d.sections << (@s1 =  Section.create!( :name => "1" ))     
      30.times do
        @d.guests << guest
      end

      visit "/admin/section"
      click_link @s1.full_name
    end
    
    it "現在の呼出番号という文言が存在すること" do
      page.should have_content("現在の呼出番号")
    end
    
    describe "呼出ボタンを押す", :js => true  do
      
      before do
        click_button '呼出'        
      end

      it do
        guest = @d.guests.first
        page.find('#accept_number').text.should == guest.accept_number.to_s
      end
    end

  end

end
