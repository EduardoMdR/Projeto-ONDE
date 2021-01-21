class TagsController < ApplicationController
  ##### Autenticação #####

  ##### SHOW #####
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @offers = Offer.where(tag: @tag)
  end

  ###### CREATE #####
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    begin
      @tag.save!
      flash[:notice] = "Tag #{@tag.name} criada com sucesso"
      redirect_to tag_path(@tag)
    rescue => exception
      flash[:notice] = exception
      redirect_to tags_path
    end
  end

  ##### UPDATE #####
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    begin
      @tag.update!(tag_params)
      flash[:notice] = "Tag #{@tag.name} atualizada com sucesso"
      redirect_to tag_path(@tag)
    rescue => exc
      flash[:notice] = exc
      redirect_to tags_path
    end
  end

  ##### DELETE #####
  def destroy
    @tag = Tag.find(params[:id])
    begin
      @tag.destroy!
      flash[:notice] = "Tag #{@tag.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to tags_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR TAGS_PARAMS
  private
    def tag_params
      params.require(:tag).permit(:name, :description)
    end
end
