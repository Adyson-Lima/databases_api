class Api::V1::DatabasesController < ApplicationController

  #before_action :set_database, only: %i[] # show update destroy

  def index
    @databases = Database.all 
    render json: @databases
  end

private

def set_database
  @database = Database.find(params[:id])
end

def database_params
  params.require(:database).permit(:name, :community)
end

end