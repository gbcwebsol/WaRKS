# -*- coding: utf-8 -*-
require 'spec_helper'

describe LobbyController do

  describe "ゲストの新規作成" do
    before do
      @department = FactoryGirl.create(:department)
      post :create, {:guest =>{ :uid => "hogehoge", :department_id => @department.id}}
    end

    it do
      assigns(:guest).department.should_not be_nil
    end

  end

end
