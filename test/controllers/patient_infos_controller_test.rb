require 'test_helper'

class PatientInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_info = patient_infos(:one)
  end

  test "should get index" do
    get patient_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_info_url
    assert_response :success
  end

  test "should create patient_info" do
    assert_difference('PatientInfo.count') do
      post patient_infos_url, params: { patient_info: { age: @patient_info.age, asthma: @patient_info.asthma, birth_state_id: @patient_info.birth_state_id, cardiovascular: @patient_info.cardiovascular, cronic_renal: @patient_info.cronic_renal, death_date: @patient_info.death_date, diabetes: @patient_info.diabetes, epoc: @patient_info.epoc, hospital_state_id: @patient_info.hospital_state_id, hospitalization_date: @patient_info.hospitalization_date, hypertension: @patient_info.hypertension, immunosuppression: @patient_info.immunosuppression, intubated: @patient_info.intubated, migrant: @patient_info.migrant, nationality_country: @patient_info.nationality_country, nationality: @patient_info.nationality, native_language: @patient_info.native_language, obesity: @patient_info.obesity, other_case: @patient_info.other_case, other_complication: @patient_info.other_complication, patient_id: @patient_info.patient_id, pneumonia: @patient_info.pneumonia, pregnant: @patient_info.pregnant, residence_municipality_id: @patient_info.residence_municipality_id, residence_state_id: @patient_info.residence_state_id, result: @patient_info.result, symptoms_date: @patient_info.symptoms_date, tabaquism: @patient_info.tabaquism, uci: @patient_info.uci, update_date: @patient_info.update_date } }
    end

    assert_redirected_to patient_info_url(PatientInfo.last)
  end

  test "should show patient_info" do
    get patient_info_url(@patient_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_info_url(@patient_info)
    assert_response :success
  end

  test "should update patient_info" do
    patch patient_info_url(@patient_info), params: { patient_info: { age: @patient_info.age, asthma: @patient_info.asthma, birth_state_id: @patient_info.birth_state_id, cardiovascular: @patient_info.cardiovascular, cronic_renal: @patient_info.cronic_renal, death_date: @patient_info.death_date, diabetes: @patient_info.diabetes, epoc: @patient_info.epoc, hospital_state_id: @patient_info.hospital_state_id, hospitalization_date: @patient_info.hospitalization_date, hypertension: @patient_info.hypertension, immunosuppression: @patient_info.immunosuppression, intubated: @patient_info.intubated, migrant: @patient_info.migrant, nationality_country: @patient_info.nationality_country, nationality: @patient_info.nationality, native_language: @patient_info.native_language, obesity: @patient_info.obesity, other_case: @patient_info.other_case, other_complication: @patient_info.other_complication, patient_id: @patient_info.patient_id, pneumonia: @patient_info.pneumonia, pregnant: @patient_info.pregnant, residence_municipality_id: @patient_info.residence_municipality_id, residence_state_id: @patient_info.residence_state_id, result: @patient_info.result, symptoms_date: @patient_info.symptoms_date, tabaquism: @patient_info.tabaquism, uci: @patient_info.uci, update_date: @patient_info.update_date } }
    assert_redirected_to patient_info_url(@patient_info)
  end

  test "should destroy patient_info" do
    assert_difference('PatientInfo.count', -1) do
      delete patient_info_url(@patient_info)
    end

    assert_redirected_to patient_infos_url
  end
end
