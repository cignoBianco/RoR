class DeseasesController < ApplicationController
   
  skip_before_action :verify_authenticity_token

  # Show all deseases
  # GET
  # /deseases
  def index
    @deseases = Desease.order(:id)

    render json: @deseases
  end


  # Show one desease by id
  # GET
  # /deseases/:id
  # :id — desease identifier
  def show
    begin
      @desease = Desease.find(params[:id])
      render json: @desease
    rescue ActiveRecord::RecordNotFound => e
      render json: e, status: :unprocessable_entity
    end
      
  end
  

  # Create a new desease in database.
  # POST
  # /deseases/new
  # desease_params
  def create
    @desease = Desease.new(desease_params)

    if @desease.save
      render json: @desease, status: :ok
    else
      render json: @desease.errors, status: :unprocessable_entity
    end
  end


  # Update the desease
  # PUT & PATCH
  # /deseases/:id
  def update
    @desease = Desease.find(params[:id])

    if @desease.update(desease_params)
      render json: @desease, status: :ok
    else
      render json: @desease.errors, status: :unprocessable_entity
    end
  end


  # Delete a desease
  # DELETE
  # /deseases/:id
  def destroy
    @desease = Desease.find(params[:id])
    @desease.destroy
    
    head :no_content, status: :ok
  end


  private
    # Desease params.
    def desease_params
      params.require(:desease).permit(:title, :body_part, :description)
    end

end
