# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_02_094504) do

  create_table "municipalities", force: :cascade do |t|
    t.string "name"
    t.integer "state_id", null: false
    t.integer "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_municipalities_on_state_id"
  end

  create_table "patient_infos", id: :string, force: :cascade do |t|
    t.string "patient_id", null: false
    t.integer "hospital_state_id", null: false
    t.integer "birth_state_id", null: false
    t.integer "residence_state_id", null: false
    t.integer "residence_municipality_id", null: false
    t.date "update_date"
    t.date "hospitalization_date"
    t.date "symptoms_date"
    t.date "death_date"
    t.integer "origin"
    t.integer "sector"
    t.integer "gender"
    t.integer "intubated"
    t.integer "pneumonia"
    t.integer "age"
    t.integer "pregnant"
    t.integer "native_language"
    t.integer "diabetes"
    t.integer "epoc"
    t.integer "asthma"
    t.integer "immunosuppression"
    t.integer "hypertension"
    t.integer "other_complication"
    t.integer "cardiovascular"
    t.integer "obesity"
    t.integer "cronic_renal"
    t.integer "tabaquism"
    t.integer "other_case"
    t.integer "result"
    t.integer "migrant"
    t.integer "uci"
    t.integer "nationality"
    t.string "nationality_country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_state_id"], name: "index_patient_infos_on_birth_state_id"
    t.index ["hospital_state_id"], name: "index_patient_infos_on_hospital_state_id"
    t.index ["patient_id"], name: "index_patient_infos_on_patient_id"
    t.index ["residence_municipality_id"], name: "index_patient_infos_on_residence_municipality_id"
    t.index ["residence_state_id"], name: "index_patient_infos_on_residence_state_id"
  end

  create_table "patients", id: :string, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "municipalities", "states"
  add_foreign_key "patient_infos", "municipalities", column: "residence_municipality_id"
  add_foreign_key "patient_infos", "patients"
  add_foreign_key "patient_infos", "states", column: "birth_state_id"
  add_foreign_key "patient_infos", "states", column: "hospital_state_id"
  add_foreign_key "patient_infos", "states", column: "residence_state_id"
end
