# -*- coding: utf-8 -*-
require 'net/http'
module ApplicationHelper
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block) }
    uri = URI.parse("#{Settings.faye_server}/faye")
    begin
      Net::HTTP.post_form(uri, :message => message.to_json)
    rescue Exception => e
      logger.debug e
    end
  end

  def num_to_soundparts( num )
    array = num.to_s.split(//).reverse
    result = []
    array.each_with_index do |n,i|  
      next if n == '0' 
      if 0 == i
        result << n 
      else
        result << (10 ** i).to_s
        result << n if n != '1'
      end
    end
    result.reverse
  end

  DEPARTMENT_SOUND = {
    "内科" => "naika",
    "外科" => "geka",
    "小児科" => "syounika",
    "皮膚科" => "hifuka",
    "呼吸器科" => "kokyukika",
    "産婦人科" => "sanfujinka",
  }

  def all_sound_parts(num,department,section = nil)
    sounds = num_to_soundparts( num )
    sounds << "bannokataha"
    sounds << DEPARTMENT_SOUND[department]
    if section
      sounds << section
    end
    sounds << "noshinsatsushitsuhe"
  end

  def sound_paths(num,department,section = nil)
    all_sound_parts(num,department,section).map do |s|
      asset_path("#{s}.mp3")
    end    
  end

end


