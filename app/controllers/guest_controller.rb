# -*- coding: utf-8 -*-
class GuestController < ApplicationController
  include ApplicationHelper

  #DELETE 間違いユーザーの取消
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
  end

end
