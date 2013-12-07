class TipsController < ApplicationController

  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find_by(id: params[:id])
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new
    @tip.user_id = current_user.id
    @tip.title = params[:title]
    @tip.description = params[:description]
    @tip.room = params[:room]
    @tip.price = params[:price]
    @tip.saving = params[:saving]

    if @tip.save
      redirect_to tips_url, notice: "Tip created successfully."
    else
      render 'new'
    end
  end

  def edit
    @tip = Tip.find_by(id: params[:id])
  end

  def update
    @tip = Tip.find_by(id: params[:id])
    @tip.user_id = params[:user_id]
    @tip.title = params[:title]
    @tip.description = params[:description]
    @tip.room = params[:room]
    @tip.price = params[:price]
    @tip.saving = params[:saving]

    if @tip.save
      redirect_to tips_url, notice: "Tip updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @tip = Tip.find_by(id: params[:id])
    @tip.destroy

    redirect_to tips_url, notice: "Tip deleted."
  end
end
