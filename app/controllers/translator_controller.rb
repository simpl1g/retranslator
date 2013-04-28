class TranslatorController < ApplicationController
  def index
    @translators = Translator.all

    respond_to do |format|
      format.html
      format.json { render json: @translators }
    end
  end

  def show
    @translator = Translator.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @translator }
    end
  end

  def new
    @translator = Translator.new

    respond_to do |format|
      format.html
      format.json { render json: @translator }
    end
  end

  def edit
    @translator = Translator.find(params[:id])
  end

  def create
    params[:translator][:id] = current_user.id
    @translator = current_user.build_translator(params[:translator])

    respond_to do |format|
      if @translator.save
        current_user.update_attributes :role => Role[:translator]
        format.html { redirect_to translators_path, notice: 'Translator was successfully created.' }
        format.json { render json: @translator, status: :created, location: @translator }
      else
        format.html { render action: "new" }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @translator = Translator.find(params[:id])

    respond_to do |format|
      if @translator.update_attributes(params[:translator])
        current_user.update_attributes :role => Role[:translator]
        format.html { redirect_to @translator, notice: 'Translator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @translator = Translator.find(params[:id])
    @translator.destroy

    respond_to do |format|
      format.html { redirect_to translators_path }
      format.json { head :no_content }
    end
  end
end
