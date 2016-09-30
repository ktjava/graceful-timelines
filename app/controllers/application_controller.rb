require 'koala'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  CLIENT_ID = '192478574514082'
  CLIENT_SECRET = 'f6a502571a9acf919d2baa1fe812acc0'
  ACCESS_TOKEN = 'EAACvDukPj6IBABsSISZCqNAYoWQzjVhVTqpuMZCJjWZC8S4BDPvqF8bfOlRuJ4libIEL3T5Sij8VbQnuPJZBROV0pRUj6wEOnSv9JKkmZAxkPPMhnRHcAae7EOZCZBkWcXgSUwMBHp4lZARKcf8z1hR4LFG1Tpk6w3oZD'
  def initialize
    super
    graph = Koala::Facebook::API.new(ACCESS_TOKEN)
    timelines = graph.get_connections("me", "?fields=posts.limit(100)")
    timeline_ar = {}
    timelines["posts"]["data"].each do |timeline|
      timeline_ar["posted_date"] = timeline["created_time"]
      timeline_ar["sns_name"] = "facebook"
      timeline_ar["message"] = timeline["message"]
      print timeline_ar
      @timelines = Timeline.create(timeline_ar)
    end
  end
end
