# -*- coding: utf-8 -*-
require 'namegen'
require 'strrand'

include JpName

if Rails.env == "development"
  
  Department.delete_all
  Section.delete_all
  Count.delete_all
  @@string_random = StringRandom.new

  def guest
    Guest.create(                     
                 :name => gen_random_name,
                 :uid => @@string_random.random_pattern('nnnnnnnnn'),
                 :accept_number => Count.count_up
                 )
  end

  #
  d = Department.create(
                    :name => "内科"                  
                    )
  d.sections << Section.create(
                               :name => "1"
                               )
  d.sections << Section.create(
                               :name => "2"
                               )
  d.sections << Section.create(
                               :name => "3"
                               )

  30.times do
    d.guests << guest
  end


  #
  d = Department.create_with_section(
                    :name => "外科"                    
                    )
  20.times do
    d.guests << guest
  end
  d.yobidashi(d.guests.first)

  #
  d = Department.create_with_section(
                    :name => "小児科"                  
                    )

  #
  d = Department.create_with_section(
                    :name => "皮膚科"                  
                    )

  #
  d = Department.create_with_section(
                    :name => "呼吸器科"                  
                    )

  #
  d = Department.create_with_section(
                    :name => "産婦人科"                  
                    )


end
