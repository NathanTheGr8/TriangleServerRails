class ActivesController < ApplicationController
  before_action :set_active, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def makeinitials
    Active.makeinitials()
    redirect_to actives_path, notice: "Initials Made"
  end

  def import
    Active.import(params[:file])
    redirect_to actives_path, notice: "Actives imported."
  end

  def index
    @actives = Active.all
    respond_to do |format|
      format.html
      format.csv { send_data @actives.to_csv }
    end
  end

  def show
    respond_with(@active)
  end

  def new
    @active = Active.new
    respond_with(@active)
  end

  def edit
  end

  def create
    @active = Active.new(active_params)
    @active.save
    respond_with(@active)
  end

  def update
    @active.update(active_params)
    respond_with(@active)
  end

  def destroy
    @active.destroy
    respond_with(@active)
  end

  private
    def set_active
      @active = Active.find(params[:id])
    end

    def active_params
      params.require(:active).permit(:first, :middle, :last, :phone, :email, :year, :major, :pledgeclass, :inhouse)
    end
end
