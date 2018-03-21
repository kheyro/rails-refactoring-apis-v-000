class RepositoriesController < ApplicationController
  before_action :authenticate_user

  def index
    github = GithubService.new({"access_token" => session[:token]})
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new({"access_token" => session[:token]})
    @repos_array = github.create_repo(params[:name])
    redirect_to '/'
  end
end
