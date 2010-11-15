require 'rubygems'
require 'open-uri'
require 'json'
require 'active_record'
require 'dbconfig'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class TwitterItem < ActiveRecord::Base
end
class User < ActiveRecord::Base
end


class WallCollector

  def initialize()
    @base_url = "https://graph.facebook.com/" 
    @end_url = "/home?since=last week&access_token="
  end

  def collect()
    user = User.new
    user.fb_id = MyConf::CURRENT_USER_ID
    user.save

    collect_items(user.fb_id)
  end


  def collect_items(user_id)

    offset = 0
    loop do
      url =  URI.parse(URI.encode( @base_url + user_id.to_s + @end_url + MyConf::ATOKEN + "&limit=500&offset=" + (offset * 500).to_s))
      puts 'opening' + url.to_s 
      open_url = open(url)
      #puts "status" + open_url.status.to_s
      if open_url.status[0] == "200"
        json_raw = open_url.read()
        #puts json_raw
        json = JSON.parse(json_raw)

        if json['data'].size == 0
          puts 'empty page, stop crawling user ' + user_id.to_s
          break
        end

        json['data'].each do |j|
          puts j['id']    

          item = TwitterItem.new
          item.fb_id = user_id
          item.fb_item_id = j['id']
          item.fb_creator_id = j['from']['id']
          item.title = j['name']
          item.description = j['description']
          item.content = j['message']
          item.url = j['link']
          item.topic_id = j['']
          item.created_at = j['created_time']
          item.updated_at = j['updated_time']
          item.favicon = j['icon']
          item.type = j['type']
          item.likes = j['likes']
          if j['comments'] != nil
            item.comments = j['comments']['count']
          end
          #item.topic_score = j['']
          #item.language = j['']
          #item.content_length = j['']
          item.img_url = j['picture']
          item.save  
        end

        offset += 1
      else
        puts 'error fetching '+ url.to_s
        break
      end
    end
  end

end


c = WallCollector.new()
c.collect
