class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: [:index, :show]
  after_action :verify_policy_scoped, except: [:index, :show]


  def index
    @forms = Form.all
  end

  def show; end

  def new
    authorize @form

    @form = Form.new
  end

  def edit
    authorize @form
  end

  def create
    authorize @form

    @form = Form.new(form_params)
    @form.user = current_user

    if @form.save
      redirect_to @form, notice: 'Form was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @form

    if @form.update(form_params)
      redirect_to @form, notice: 'Form was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @form

    @form.destroy
    redirect_to forms_url, notice: 'Form was successfully destroyed.'
  end

  private

  def set_form
    @form = current_user.forms.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:title, :description)
  end
end
