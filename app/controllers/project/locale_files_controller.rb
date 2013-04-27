class Project::LocaleFilesController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file, :except => [:index, :create]

  def index
    @locale_files = @project.locale_files
  end

  def show

  end

  def destroy
    @locale_file.destroy
  end

  private
  def find_locale_file
    @locale_file = @project.locale_files.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
