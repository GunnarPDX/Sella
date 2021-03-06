# frozen_string_literal: true

class TagsController < ApplicationController
  require 'open-uri'
  require 'net/http'
  require 'uri'
  require 'json'

  before_action :set_tag, only: %i[edit update destroy]

  def index
    @tags = Tag.where(isTranscribed: !true).search(params[:search]).paginate(page: params[:page], per_page: 4)
  end

  def transcribed_tags
    @tags = Tag.where(isTranscribed: true).search(params[:search]).paginate(page: params[:page], per_page: 4)
  end

  def edit
    # @image = Image.find(@tag.image_id)
  end

  def create
    @product = Product.find(params[:product_id])
    @tag = @product.tags.create(tag_params)
    Tag.transcribe(@tag.fullUrl, @tag)

    respond_to do |format|
      if @tag.save!
        format.js
        format.html { redirect_to root_path, notice: 'Tag was successfully created.' }
      else
        error.js
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: 'Tag was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to tags_path, notice: 'Tag was successfully destroyed.' }
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:category, :handle, :fullUrl, :cropX, :cropY, :cropH, :cropW, :rotate, :isTranscribed, :transcription, :image_id, :isVisionTrue, :visionResult)
  end
end
