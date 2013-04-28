class LocaleFilesController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file, :except => [:index, :create]

  def index
    @locale_files = @project.locale_files
  end

  def show
    @phrases = @locale_file.phrases.roots.sort { |a, b| [b.complicated? ? 1 : 0, a.name]<=>[a.complicated? ? 1 : 0, b.name] }
    @phrases_with_translations = @locale_file.phrases.where(:complicated => false).limit(5)
  end

  def create
    @locale_file = @project.locale_files.create(:file => params[:file])
    @locale_file.import_phrases(current_user)
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
