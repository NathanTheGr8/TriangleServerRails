class DjsController < ApplicationController
  before_action :set_dj, only: [:show, :edit, :update, :destroy]

  respond_to :html
  #intials = ["KAJ", "AMW”, “JMB", "AWW", "DCG", "JPM", "MDH", "MDP", "BBZ", "CPU", "GWP", "JSS", "IJL", "KAM", "LLL", "DPM", "TLC", "JRS", "AMN", "GMV", "MJV", "NHD", "NGP", "DML", "ELL", "NRD", "MNB", "KIL", "MGN", "APP", "HHH", "SMB", "GPS", "ABB", "MSH", "HTJ", "HCS", "APE", "DUH", "JMR", "DMF", "CJV", "KJS", "ADS", "MCS", "RSZ", "JFK", "WDM", "SEH", "TRV", "A$S", "MJE", "CES", "MCS", "AVP", "HLM", "JBW"]

  #“KAJ”, “AMW”, “JMB”, “AWW”, “DCG”, “JPM”, “MDH”, “MDP”, “BBZ”, “CPU”, “GWP”, “JSS”, “IJL”, “KAM”, “LLL”, “DPM”, “TLC”, “JRS”, “AMN”, “GMV”, “MJV”, “NHD”, “NGP”, “DML”, “ELL”, “NRD”, “MNB”, “KIL”, “MGN”, “APP”, “HHH”, “SMB”, “GPS”, “ABB”, “MSH”, “HTJ”, “HCS”, “APE”, “DUH”, “JMR”, “DMF”, “CJV”, “KJS”, “ADS”, “MCS”, “RSZ”, “JFK”, “WDM”, “SEH”, “TRV”, “A$S”, “MJE”, “CES”, “MCS”, “AVP”, “HLM”, “JBW”
  def make
    #@bros = User.all
    Dj.make()
    redirect_to djs_path, notice: "DJs made for Week"
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
    @dj.update(dj_params)
    respond_with(@dj)
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
