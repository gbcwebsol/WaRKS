# -*- coding: utf-8 -*-
class SectionController < ApplicationController
  include ApplicationHelper

  #GET 待合管理TOP
  def index
    @departments = Department.all
    render :layout => "section"
  end

  #GET 待合管理
  def show
    @section = Section.find(params[:id])
    @active_guests = @section.department.active_guests
    @pass_guests = @section.department.pass_guests    
    render :layout => "section"
  end

  def anaunce    
    @section = Section.find params[:id]    
    @guest = @section.guest
  end

  #POST 呼出 /admin/section/:id/guest(/:guest_id)
  def create_guest
    @section = Section.find(params[:id])
    if params[:guest_id]
      @guest = Guest.find(params[:guest_id])
    else
      @guest = @section.department.active_guests.first
    end

    if @guest
      @guest.section = @section
      @guest.pass = false
      @guest.save
    end
  end

  #PUT スキップ /admin/section/:id/guest/
  def update_guest
    @section = Section.find(params[:id])
    @guest = @section.guest
    @guest.pass = true
    @guest.section = nil
    @guest.save
  end

  #DELETE 終了 /admin/section/:id/guest/
  def destroy_guest
    @section = Section.find(params[:id])    
    @guest = @section.guest
    @guest.section = nil
    @guest.finish = true
    @guest.save  
  end

end
