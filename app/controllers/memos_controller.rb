class MemosController < ApplicationController
  before_action :authenticate_user!


  def new
  	@memo = Memo.new
  end

  def index
  	@memos = Memo.all.order(created_at: :desc)
  end

  def show
  	@memo = Memo.find_by(id: params[:id])
  end

  def create
  	@memo = Memo.new(content_params)
  	if @memo.save
  		flash[:notice] = "メモを保存しました"
  		redirect_to memos_path
  	else
  		render :new
  	end
  end

  def edit
  	@memo = Memo.find_by(id: params[:id])
  end

  def update
  	@memo = Memo.find_by(id: params[:id])
    @memo.assign_attributes(content_params)
  	if @memo.save
  		flash[:notice] = "メモを編集しました"
  		redirect_to memos_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@memo = Memo.find_by(id: params[:id])
  	@memo.destroy!
  	flash[:notice] = "メモを削除しました"
  	redirect_to memos_path
  end

   private

   def content_params
    params.permit(:content)
  end
end
