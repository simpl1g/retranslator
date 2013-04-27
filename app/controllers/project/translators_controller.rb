class Project::TranslatorsController < ApplicationController
  before_filter :find_project
  before_filter :find_translator, :except => [:index, :create]

  def index
    @translators = @project.translators
  end

  def create
    @project.project_users.create(:role => Role[:translator], :user => Translator.find(params[:translator]).user)
    redirect_to @project
  end

  def destroy
    @project.project_users.where(:user_id => @translator.user.id, :role => Role[:translator]).first.destroy
    redirect_to @project
  end

  private
  def find_translator
    @translator = @project.translators.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
