class ProfilesController < ApplicationController
  def index
    search_query = params[:query]
    query = User.ransack(username_cont: search_query)
    @users = query.result(distince: true)
  end

  def users
  query = User.ransack(username_cont: search_query)

    query.result(distince:true )

    @users = query.result(distince: true)
  end

  def search_query
    params[:query]
  end
end
