class PhrasesTranslationsController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file
  before_filter :find_phrase, :except=>[:index]
  before_filter :load_locale
  before_filter :find_phrase_translation, :only => [:show, :edit, :update]

  def show
    render :partial => 'phrase_translations/show'
  end

  def new
    @phrase_translation = @phrase.phrase_translations.build
    render :partial => 'phrase_translations/new'
  end

  def edit
    render :partial => 'phrase_translations/edit'
  end

  def update
    render :partial => 'phrase_translations/show'
  end

  def create
    render :partial => 'phrase_translations/show'
  end

  def index
    if @phrase
      @phrases = @phrase.children
    else

    end
  end

  private

  def load_locale

  end

  def find_phrase_translation
    @phrase_translation = @phrase.phrase_translations.find(params[:id])
  end

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