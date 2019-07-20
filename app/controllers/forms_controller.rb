class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_form, only: [:show, :edit, :update, :publish, :destroy]

  def index
    @forms = policy_scope(Form)
  end

  def show
    authorize @form
  end

  def new
    @form = Form.new
    @form.form_questions.build

    authorize @form
  end

  def edit
    authorize @form
  end

  def create
    @form = Form.new(form_params)
    @form.user = current_user

    authorize @form

    if @form.save
      redirect_to @form, notice: I18n.t('controllers.form.created')
    else
      render :new
    end
  end

  def update
    authorize @form

    if @form.update(form_params)
      redirect_to @form, notice: I18n.t('controllers.form.updated')
    else
      render :edit
    end
  end

  def publish
    authorize @form

    @form.publish!

    redirect_to({action: :index}, {notice: I18n.t('controllers.form.published')})
  end


  def destroy
    authorize @form

    @form.destroy
    redirect_to forms_url, notice: I18n.t('controllers.form.destroyed')
  end

  private

  def set_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:title, :description, form_questions_attributes: [:id, :title, :description, :_destroy])
  end
end
