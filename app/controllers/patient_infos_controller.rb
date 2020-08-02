class PatientInfosController < ApplicationController
  before_action :set_patient_info, only: [:show, :edit, :update, :destroy]

  # GET /patient_infos
  # GET /patient_infos.json
  def index
    @patient_infos = PatientInfo.all
  end

  # GET /patient_infos/1
  # GET /patient_infos/1.json
  def show
  end

  # GET /patient_infos/new
  def new
    @patient_info = PatientInfo.new
  end

  # GET /patient_infos/1/edit
  def edit
  end

  # POST /patient_infos
  # POST /patient_infos.json
  def create
    @patient_info = PatientInfo.new(patient_info_params)

    respond_to do |format|
      if @patient_info.save
        format.html { redirect_to @patient_info, notice: 'Patient info was successfully created.' }
        format.json { render :show, status: :created, location: @patient_info }
      else
        format.html { render :new }
        format.json { render json: @patient_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_infos/1
  # PATCH/PUT /patient_infos/1.json
  def update
    respond_to do |format|
      if @patient_info.update(patient_info_params)
        format.html { redirect_to @patient_info, notice: 'Patient info was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_info }
      else
        format.html { render :edit }
        format.json { render json: @patient_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_infos/1
  # DELETE /patient_infos/1.json
  def destroy
    @patient_info.destroy
    respond_to do |format|
      format.html { redirect_to patient_infos_url, notice: 'Patient info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_info
      @patient_info = PatientInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_info_params
      params.require(:patient_info).permit(:patient_id, :hospital_state_id, :birth_state_id, :residence_state_id, :residence_municipality_id, :update_date, :hospitalization_date, :symptoms_date, :death_date, :intubated, :pneumonia, :age, :nationality, :pregnant, :native_language, :diabetes, :epoc, :asthma, :immunosuppression, :hypertension, :other_complication, :cardiovascular, :obesity, :cronic_renal, :tabaquism, :other_case, :result, :migrant, :uci, :nationality_country)
    end
end
