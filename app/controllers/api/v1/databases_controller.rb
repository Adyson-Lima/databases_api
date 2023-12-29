class Api::V1::DatabasesController < ApplicationController

  before_action :set_database, only: %i[show update destroy] # show update destroy

  def index
    @databases = Database.all 
    render json: @databases
  end

  def show
    render json: @database
  end

  def create
    @database = Database.new(database_params)
    if @database.save
      render json: @database, status: :created, location: api_v1_database_url(@database)
    else
      render json: @database.errors, status: :unprocessable_entity
    end
  end

  def update
    if @database.update(database_params)
      render json: @database
    else
      render json: @database.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @database.destroy!
  end

private

def set_database
  @database = Database.find(params[:id])
end

def database_params
  params.require(:database).permit(:name, :community)
end

end