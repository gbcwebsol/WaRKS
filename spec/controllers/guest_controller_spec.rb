# -*- coding: utf-8 -*-
require 'spec_helper'

describe GuestController do
  
  describe "ゲストの受付完了パターン" do
    before do
      @guest = Factory.create(:guest)
      @section = Factory.create(:section)
      @guest.department.sections << @section
      @guest.section = @section
      @guest.save
    end

    describe "現在対応中のユーザーを削除" do
      before do
        post :destroy, {:id => @guest.id, :format => "js"}        
      end

      it "destroy" do
        guest = assigns(:guest)
        guests = Guest.find(:all)
        guests.include?(guest).should be_false
      end
    end

    describe "待受中のユーザーを削除" do
      before do
        @guest.section = nil
        @guest.save
        post :destroy, {:id => @guest.id, :format => "js"}        
      end

      it "destroy" do
        guest = assigns(:guest)
        guests = Guest.find(:all)
        guests.include?(guest).should be_false
      end
    end

  end

end
