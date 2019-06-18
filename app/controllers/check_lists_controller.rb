class CheckListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = Checklist.all
  end

  def show
  end

  def new
    @list = Checklist.new
  end

  def edit
  end

  def create
    @list = CheckList.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'CheckList was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'CheckList was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to check_check_lists_url, notice: 'CheckList was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_list
      @list = Checklist.find(params[:id])
    end

    def list_params
      params.fetch(:list, {}).permit(:title, :description, :project_id, :table)
    end
end
