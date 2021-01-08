class SymptomsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # Show all symptoms
  # GET
  # /sympoms
  def index
    @symptoms = Symptom.all

    render json: @symptoms
  end


  # Show one symptom by id
  # GET
  # /symptoms/:id
  # :id — symptom identifier
  def show
    begin
      @symptom = Symptom.find(params[:id])
      render json: @symptom
    rescue ActiveRecord::RecordNotFound => e
      render json: e, status: :unprocessable_entity
    end
  end
  

  # Create a new symptom in database.
  # POST
  # /symptoms/new
  # symptom_params
  def create
    @symptom = Symptom.new(symptom_params)

    if @symptom.save
      render json: @symptom, status: :created
    else
      render json: @symptom.errors, status: :unprocessable_entity
    end
  end


  # Update the symptom
  # PUT & PATCH
  # /symptoms/:id
  def update
    @symptom = Symptom.find(params[:id])

    if @symptom.update(symptom_params)
      render json: @symptom, status: :updated
    else
      render json: @symptom.errors, status: :unprocessable_entity
    end
  end


  # Delete a symptom
  # DELETE
  # /symptoms/:id
  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy
    
    head :no_content, status: :ok
  end

  
  # Get symptoms of desease
  # GET
  # /desease-symptoms/:id
  def get_symptoms
    begin
    @desease = Desease.find(params[:id])

      @symptoms = @desease.symptoms
      render json: @symptoms
    rescue ActiveRecord::RecordNotFound => e
      render json: e, status: :unprocessable_entity
    end
 
    
  end


  private
    # symptom params.
    def symptom_params
      params.require(:symptom).permit(:title, :body_part, :description)
    end

end
