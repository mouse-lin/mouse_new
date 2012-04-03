# -*- encoding : utf-8 -*-
class HomesController < ApplicationController
  protect_from_forgery :except => :create_comment

  def index
    @comment = Comment.paginate(:order => "id desc", :page => params[:page],:per_page => 15)      
    @page_pre = params[:page].to_i - 1 == 0? 1 : params[:page].to_i - 1
    @page_next = params[:page].to_i + 1
  end

  def destroy_comment
    Comment.find(params[:id]).delete
    flash[:info] = "删除成功"
    redirect_to "/homes"
  end

  def create_comment
    Comment.create!(params[:comment])
    redirect_to "/homes"
  rescue ActiveRecord::RecordInvalid => e
    flash[:info] = e.message
    redirect_to "/homes" 
  end


end
