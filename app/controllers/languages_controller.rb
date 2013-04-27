class LanguagesController < ApplicationController
  before_filter :find_language

  def translators
    render :json => @language.translators.map { |tr| {:id => tr.id, :name => tr.user.email}}
  end

  def find_language
    @language = Language.find_by_name(params[:id])
  end

end