class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: json_out = {
        "timeline"=>
        {
          "headline"=>"The Main Timeline Headline Goes here",
          "type"=>"default",
          "text"=>"<p>Intro body text goes here, some HTML is ok</p>",
          "asset"=> {
          "media"=>"http://www.exglam.com/wp-content/uploads/2013/02/Kajal-agarwal-in-Blue-and-white-Fade-Short-with-white-Top-and-a-Blue-bow-in-hair.jpg",
          "credit"=>"Credit Name Goes Here",
          "caption"=>"Caption text goes here"
        },

          "date"=> @histories.map { |timeline| {"startDate" => timeline.startdate.strftime("%Y,%m,%d"),"endDate" => timeline.enddate.strftime("%Y,%m,%d"),"headline" => timeline.headline,"text" => timeline.content, "asset" => {"media" => timeline.media}}},


          "era"=> [
            {
          "startDate"=>"2011,12,10",
          "endDate"=>"2011,12,11",
          "headline"=>"Headline Goes Here",
          "text"=>"<p>Body text goes here, some HTML is OK</p>",
          "tag"=>"This is Optional"
        }

        ]
        }
      } }
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { render action: 'new' }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_history
    @history = History.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def history_params
    params.require(:history).permit(:startdate, :enddate, :content, :headline, :media, :mediacaption, :mediacredit)
  end
end
