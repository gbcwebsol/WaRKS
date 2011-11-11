# -* -coding: utf-8 -*-
class LobbyController < ApplicationController

  layout "lobby", :except => :show_smartphone

  #待合画面
  def index
    @departments = Department.find :all    
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def show_smartphone
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
    @departments = Department.all
  end

  def create
    @guest = Guest.new(params[:guest])
    @guest.accept_number = Count.count_up
    if @guest.save
      redirect_to lobby_path(@guest)
    else
      @departments = Department.all      
      render new_lobby_path
    end
  end

end
