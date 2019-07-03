class CheckListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_list, only: [:show, :edit, :update, :destroy]

  def index
    @check_list = current_user.check_lists.new
    prepare_data_for_index
  end

  def edit
    authorize @check_list
  end

  def create
    @check_list = CheckList.new(check_list_create_params)
    @check_list.user = current_user

    authorize @check_list

    if @check_list.save
      redirect_to({action: :index}, {notice: 'Checklist was created'})
    else
      prepare_data_for_index
      render :index
    end
  end

  def update
    authorize @check_list

    @check_list.assign_attributes(check_list_update_params)
    @check_list.answers.each do |answer|
      answer.user = current_user if answer.changed?
    end

    if @check_list.save
      redirect_to({action: :index}, {notice: 'Check list was successfully updated.'})
    else
      render :edit
    end
  end

  def destroy
    authorize @check_list

    @check_list.destroy
    redirect_to check_lists_url, notice: 'Check list was successfully destroyed.'
  end

  private

  def prepare_data_for_index
    @check_lists = policy_scope(CheckList)
    @forms = Form.select(:id, :title).order(:title).all
  end

  def set_check_list
    @check_list = CheckList.find(params[:id])
  end

  def check_list_create_params
    params.require(:check_list).permit(:project_uid, :form_id)
  end

  def check_list_update_params
    params.require(:check_list).permit(answers_attributes: [:id, :response, :comment])
  end
end
