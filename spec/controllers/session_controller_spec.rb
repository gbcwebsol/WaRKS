# -*- coding: utf-8 -*-
require 'spec_helper'

describe SectionController do
    
  describe "ゲストを受付" do
    
    before do
      @guest1 = Factory.create(:guest)
      @guest2 = Factory.create(:guest)
      @section1 = Factory.create(:section)
      @section2 = Factory.create(:section)
      @guest1.department.sections << @section1 
      @guest2.department.sections << @section2     
    end

    describe "ゲストIDを指定した場合" do
      before do
        post :create_guest, {:guest_id => @guest1.id, :id => @section1.id, :format => "js"}
      end
      
      it do
        assigns(:guest).section.should == @section1
      end    
    end

    describe "ゲストIDを指定しない場合" do      
      before do
        post :create_guest,{:id => @section1.id, :format => "js"}
      end

      it do
        assigns(:guest).should == @guest1
        assigns(:guest).section.should == @section1
      end
    end

    describe "ゲストIDを指定しない場合" do      
      before do
        post :create_guest,{:id => @section2.id, :format => "js"}
      end

      it do
        assigns(:guest).should_not == @guest1
        assigns(:guest).section.should == @section2
      end
    end

  end

  describe "ゲストの受付完了パターン" do
    before do
      @guest = Factory.create(:guest)
      @section = Factory.create(:section)
      @guest.department.sections << @section
      @guest.section = @section
      @guest.save
    end

    describe "ゲストの対応を終了" do
      
      before do
        delete :destroy_guest,{:id => @section.id, :format => "js"}
      end

      it do
        @section.reload.guest.should be_nil
        guest = assigns(:guest)
        guest.section.should be_nil
        guest.finish.should be_true
      end

    end

    describe "ゲストをスキップ" do      
      before do
        put :update_guest, {:id => @section.id, :format => "js"}
      end

      it do
        guest = assigns(:guest)
        guest.finish.should be_false
        guest.pass.should be_true
        guest.section.should be_nil
      end
    end

    describe "受付中のユーザーをアナウンス" do
      before do
        get :anaunce, {:id => @section.id, :format => "js"}                
      end

      it "anaunce" do
        assigns(:guest).should == @guest
      end
    end

  end

end
