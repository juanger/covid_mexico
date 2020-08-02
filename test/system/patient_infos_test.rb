require "application_system_test_case"

class PatientInfosTest < ApplicationSystemTestCase
  setup do
    @patient_info = patient_infos(:one)
  end

  test "visiting the index" do
    visit patient_infos_url
    assert_selector "h1", text: "Patient Infos"
  end

  test "creating a Patient info" do
    visit patient_infos_url
    click_on "New Patient Info"

    fill_in "Age", with: @patient_info.age
    fill_in "Asthma", with: @patient_info.asthma
    fill_in "Birth state", with: @patient_info.birth_state_id
    fill_in "Cardiovascular", with: @patient_info.cardiovascular
    fill_in "Cronic renal", with: @patient_info.cronic_renal
    fill_in "Death date", with: @patient_info.death_date
    fill_in "Diabetes", with: @patient_info.diabetes
    fill_in "Epoc", with: @patient_info.epoc
    fill_in "Hospital state", with: @patient_info.hospital_state_id
    fill_in "Hospitalization date", with: @patient_info.hospitalization_date
    fill_in "Hypertension", with: @patient_info.hypertension
    fill_in "Immunosuppression", with: @patient_info.immunosuppression
    fill_in "Intubated", with: @patient_info.intubated
    fill_in "Migrant", with: @patient_info.migrant
    fill_in "nationality country", with: @patient_info.nationality_country
    fill_in "Nationality", with: @patient_info.nationality
    fill_in "Native language", with: @patient_info.native_language
    fill_in "Obesity", with: @patient_info.obesity
    fill_in "Other case", with: @patient_info.other_case
    fill_in "Other complication", with: @patient_info.other_complication
    fill_in "Patient", with: @patient_info.patient_id
    fill_in "Pneumonia", with: @patient_info.pneumonia
    fill_in "Pregnant", with: @patient_info.pregnant
    fill_in "Residence municipality", with: @patient_info.residence_municipality_id
    fill_in "Residence state", with: @patient_info.residence_state_id
    fill_in "Result", with: @patient_info.result
    fill_in "Symptoms date", with: @patient_info.symptoms_date
    fill_in "Tabaquism", with: @patient_info.tabaquism
    fill_in "Uci", with: @patient_info.uci
    fill_in "Update date", with: @patient_info.update_date
    click_on "Create Patient info"

    assert_text "Patient info was successfully created"
    click_on "Back"
  end

  test "updating a Patient info" do
    visit patient_infos_url
    click_on "Edit", match: :first

    fill_in "Age", with: @patient_info.age
    fill_in "Asthma", with: @patient_info.asthma
    fill_in "Birth state", with: @patient_info.birth_state_id
    fill_in "Cardiovascular", with: @patient_info.cardiovascular
    fill_in "Cronic renal", with: @patient_info.cronic_renal
    fill_in "Death date", with: @patient_info.death_date
    fill_in "Diabetes", with: @patient_info.diabetes
    fill_in "Epoc", with: @patient_info.epoc
    fill_in "Hospital state", with: @patient_info.hospital_state_id
    fill_in "Hospitalization date", with: @patient_info.hospitalization_date
    fill_in "Hypertension", with: @patient_info.hypertension
    fill_in "Immunosuppression", with: @patient_info.immunosuppression
    fill_in "Intubated", with: @patient_info.intubated
    fill_in "Migrant", with: @patient_info.migrant
    fill_in "nationality country", with: @patient_info.nationality_country
    fill_in "Nationality", with: @patient_info.nationality
    fill_in "Native language", with: @patient_info.native_language
    fill_in "Obesity", with: @patient_info.obesity
    fill_in "Other case", with: @patient_info.other_case
    fill_in "Other complication", with: @patient_info.other_complication
    fill_in "Patient", with: @patient_info.patient_id
    fill_in "Pneumonia", with: @patient_info.pneumonia
    fill_in "Pregnant", with: @patient_info.pregnant
    fill_in "Residence municipality", with: @patient_info.residence_municipality_id
    fill_in "Residence state", with: @patient_info.residence_state_id
    fill_in "Result", with: @patient_info.result
    fill_in "Symptoms date", with: @patient_info.symptoms_date
    fill_in "Tabaquism", with: @patient_info.tabaquism
    fill_in "Uci", with: @patient_info.uci
    fill_in "Update date", with: @patient_info.update_date
    click_on "Update Patient info"

    assert_text "Patient info was successfully updated"
    click_on "Back"
  end

  test "destroying a Patient info" do
    visit patient_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patient info was successfully destroyed"
  end
end
