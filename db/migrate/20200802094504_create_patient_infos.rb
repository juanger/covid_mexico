class CreatePatientInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_infos, id: :string do |t|
      t.references :patient, null: false, foreign_key: true, type: :string
      t.references :hospital_state, null: false, foreign_key: false
      t.references :birth_state, null: false, foreign_key: false
      t.references :residence_state, null: false, foreign_key: false
      t.references :residence_municipality, null: false, foreign_key: false
      t.date :update_date
      t.date :hospitalization_date
      t.date :symptoms_date
      t.date :death_date
      t.integer :origin
      t.integer :sector
      t.integer :gender
      t.integer :intubated
      t.integer :pneumonia
      t.integer :age
      t.integer :pregnant
      t.integer :native_language
      t.integer :diabetes
      t.integer :epoc
      t.integer :asthma
      t.integer :immunosuppression
      t.integer :hypertension
      t.integer :other_complication
      t.integer :cardiovascular
      t.integer :obesity
      t.integer :cronic_renal
      t.integer :tabaquism
      t.integer :other_case
      t.integer :result
      t.integer :migrant
      t.integer :uci
      t.integer :nationality
      t.string :nationality_country

      t.timestamps
    end
    add_foreign_key :patient_infos, :municipalities, column: :residence_municipality_id
    add_foreign_key :patient_infos, :states, column: :hospital_state_id
    add_foreign_key :patient_infos, :states, column: :birth_state_id
    add_foreign_key :patient_infos, :states, column: :residence_state_id
  end
end
