class DjsController < ApplicationController
  before_action :set_dj, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  def make
    #@bros = User.all
    Dj.make()
    redirect_to djs_path, notice: "DJs made for Week"
  end

  def remove_all
    Dj.delete_all
    flash[:notice] = "You have removed all DJs!"
    redirect_to djs_path
  end

  def import
    Dj.import(params[:file])
    redirect_to djs_path, notice: "DJs imported."
  end

  def index
    @djs = Dj.all
    @actives = Active.all
    respond_to do |format|
      format.html
      format.csv { send_data @djs.to_csv }
      format.xls
    end
  end

  def show
    respond_with(@dj)
  end

  def new
    @dj = Dj.new
    respond_with(@dj)
  end

  def edit
  end

  def create
    @dj = Dj.new(dj_params)
    @dj.save
    respond_with(@dj)
  end

  def update
    respond_to do |format|
      if @dj.update(dj_params)
        format.html { redirect_to djs_path, notice: 'DJ was successfully updated.' }
        format.json { render :show, status: :ok, location: @dj }
      else
        format.html { render :edit }
        format.json { render json: @dj.errors, status: :unprocessable_entity }
      end
    end

    #@dj.update(dj_params)
    #respond_with(@dj)
  end

  def destroy
    @dj.destroy
    respond_with(@dj)
  end

  private
    def set_dj
      @dj = Dj.find(params[:id])
    end

    def dj_params
      params.require(:dj).permit(:name, :location, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
end
