class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.find_by(email: params[:sender])
    
    topic = Topic.find_by(title: params[:subject])

    url = params["body-plain"]

    if user.nil?
      user = User.new(email: params[:sender], password: "password1")
      user.save!
    end

    if topic.nil?
      topic = Topic.new(title: params[:subject])
      topic.save!
    end

    Rails.logger.info(user.inspect)
      bookmark = topic.bookmarks.build
      bookmark.user = user
      bookmark.url = url
      bookmark.save!

    head 200
  end
end