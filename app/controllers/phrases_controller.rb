class PhrasesController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file
  before_filter :find_phrase, :only => [:show]


  def show
    if @phrase.complicated?
      @phrases = @phrase.children.sort { |a, b| [b.complicated? ? 1 : 0, a.name]<=>[a.complicated? ? 1 : 0, b.name] }
      @phrases_with_translations = @phrase.descendants.where(:complicated=>false).limit(5)
    else
      @phrases_with_translations = [@phrase]
    end
  end

  private

  def find_phrase
    @phrase = @locale_file.phrases.find(params[:id])
  end

  def find_locale_file
    @locale_file = @project.locale_files.find(params[:locale_file_id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
