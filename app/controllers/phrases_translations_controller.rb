class PhrasesTranslationsController < ApplicationController
  before_filter :find_project
  before_filter :find_locale_file
  before_filter :find_phrase, :except => [:index]
  before_filter :load_language
  before_filter :find_phrase_translation, :only => [:show, :edit, :update]
  before_filter :load_related_translations, :only => [:edit, :new]

  def show
    render :partial => 'phrase_translations/show'
  end

  def new
    @phrase_translation = @phrase.phrase_translations.build
    @translation = TRANSLATOR.translate @phrase.phrase_translations.where(:language_id => english_id).first.value, :from => 'en', :to => @language.name
    render :partial => 'phrase_translations/new'
  end

  def edit
    @translation = TRANSLATOR.translate @phrase.phrase_translations.where(:language_id => english_id).first.value, :from => 'en', :to => @language.name
    render :partial => 'phrase_translations/edit'
  end

  def update
    render :partial => 'phrase_translations/show'
  end

  def create
    @phrase_translation = @phrase.phrase_translations.create(params[:phrase_translation].merge(:user_id => current_user.id))
    redirect_to :back
  end

  def index
    if @phrase
      @phrases = @phrase.children
    else

    end
  end

  private

  def load_language
    @language = Language.find_by_name(params[:language])
  end

  def english_id
    Language.find_by_name("en").id
  end

  def load_related_translations
    @locale_files_ids = @project.locale_file_ids
    @related_phrase_ids = Phrase.select(:id).where(:locale_file_id => @locale_files_ids)
    base_language = Language.find_by_name("en")
    base_translations = @phrase.phrase_translations.find_by_language_id(base_language.id)
    base_relateds = PhraseTranslation.where(:phrase_id => @related_phrase_ids).where("value ~* ?", base_translations.value.split.join("|")).limit(3)
    @relateds = PhraseTranslation.where(:phrase_id => base_relateds.map(&:phrase_id)).where(:language_id => @language.id)
  end

  def find_phrase_translation
    unless params[:id].to_i == 0
      @phrase_translation = @phrase.phrase_translations.find(params[:id])
    else
      @phrase_translation = @phrase.phrase_translations.build(:language_id=>@language.id)
    end
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