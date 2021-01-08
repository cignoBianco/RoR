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

 
  # Add symptoms of desease
  # POST
  # /desease-symptoms/:id
  def add_symptoms
    @desease = Desease.find(params[:id])
    #@symptoms = @desease.symptoms
    #@desease.symptoms.create(id: params[:symptom_id])
    @SOD = SymptomsOfDesease.create(desease_id: params[:id], symptom_id: params[:symptom_id]) 
    @SOD.save

    render @desease.symptoms
  end


  # Update the desease
  # PUT & PATCH
  # /deseases/:id
  def update
    @desease = Desease.find(params[:id])

    for id in params[:symptoms_id] do
    @SOD = SymptomsOfDesease.find_or_create_by(desease_id: params[:id], symptom_id: id) 
    end


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
      params.require(:desease).permit(:title, :body_part, :description, symptoms_id: [])
    end

end
