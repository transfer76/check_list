class CheckListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_list, only: [:show, :edit, :update, :destroy]

  def index
    @check_lists = CheckList.all
  end

  def show; end

  def new
    @check_list = CheckList.new
  end

  def edit; end

  def create
    @check_list = CheckList.new(check_list_params)

    if @check_list.save
      redirect_to @check_list, notice: 'Check list was successfully created.'
    else
      render :new
    end
  end

  def update
    if @check_list.update(check_list_params)
      redirect_to @check_list, notice: 'Check list was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @check_list.destroy
    redirect_to check_lists_url, notice: 'Check list was successfully destroyed.'
  end

  private
  
  def set_check_list
    @check_list = CheckList.find(params[:id])
  end

  def check_list_params
    params.fetch(:check_list, {})
  end
end
