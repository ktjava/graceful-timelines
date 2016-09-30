class StaticPagesController < ApplicationController
  def home
    @timelines = Timeline.all
  end
end
