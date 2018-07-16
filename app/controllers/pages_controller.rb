class PagesController < ApplicationController
  def home
  end

  def memo
  	@memo = Memo.new
  end

  def index
  	@memos = Memo.all.order(created_at: :desc)
  end

  def show
  	@memo = Memo.find_by(id: params[:id])
  end

  def create
  	@memo = Memo.new(content: params[:content])
  	@memo.save
  	if @memo.save
  		flash[:notice] = "メモを保存しました"
  		redirect_to("/index")
  	else
  		render("pages/memo")
  	end
  end

  def edit
  	@memo = Memo.find_by(id: params[:id])
  end

  def update
  	@memo = Memo.find_by(id: params[:id])
  	@memo.content = params[:content]
  	@memo.save
  	if @memo.save
  		flash[:notice] = "メモを編集しました"
  		redirect_to("/index")
  	else
  		render("pages/edit")
  	end
  end

  def destroy
  	@memo = Memo.find_by(id: params[:id])
  	@memo.destroy
  	flash[:notice] = "メモを削除しました"
  	redirect_to("/index")
  end
end
