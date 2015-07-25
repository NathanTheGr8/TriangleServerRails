class KevincounterController < ApplicationController
	layout 'kevincounter'
  def index
  end

  def new
    @kevincounter = Kevincounter.new
    respond_with(@kevincounter)
  end

  def edit
  end

  def create
    @kevincounter = Kevincounter.new(kevincounter_params)
    @kevincounter.save
    respond_with(@kevincounter)
  end

  def update
    respond_to do |format|
      if @kevincounter.update(kevincounter_params)
        format.html { redirect_to kevincounter_path, notice: 'Kevin Couunter was update successfully' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @kevincounter.destroy
    respond_with(@kevincounter)
  end

  private
    def set_kevincounter
      @kevincounter = Kevincounter.find(params[:id])
    end

    def kevincounter_params
      params.require(:kevincounter).permit(:id,:timestamps)
    end
end
