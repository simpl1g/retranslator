class PhrasesTranslationsController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file
  before_filter :find_phrase, :only => [:show]


  def index
    if @phrase
      @phrases = @phrase.children
    else

    end
  end

  private

  def find_phrase
    @phrase = @locale_file.phrases.find(params[:phrase_id]) if params[:phrase_id]
  end

  def find_locale_file
    @locale_file = @project.locale_files.find(params[:locale_file_id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end