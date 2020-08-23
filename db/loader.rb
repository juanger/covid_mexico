# Run with rails runner
require "csv"
require "./db/valid_municipalities"

# file_name = "../data/07.July/200728COVID19MEXICO.csv"
file_name = ARGV[0] #"../data/test.csv"

puts "Loading #{file_name}"

# "FECHA_ACTUALIZACION",
# "ID_REGISTRO",
# "ORIGEN",
# "SECTOR",
# "ENTIDAD_UM",
# "SEXO",
# "ENTIDAD_NAC",
# "ENTIDAD_RES",
# "MUNICIPIO_RES",
# "TIPO_PACIENTE",
# "FECHA_INGRESO",
# "FECHA_SINTOMAS",
# "FECHA_DEF",
# "INTUBADO",
# "NEUMONIA",
# "EDAD",
# "NACIONALIDAD",
# "EMBARAZO",
# "HABLA_LENGUA_INDIG",
# "DIABETES",
# "EPOC",
# "ASMA",
# "INMUSUPR",
# "HIPERTENSION",
# "OTRA_COM",
# "CARDIOVASCULAR",
# "OBESIDAD",
# "RENAL_CRONICA",
# "TABAQUISMO",
# "OTRO_CASO",
# "RESULTADO",
# "MIGRANTE",
# "PAIS_NACIONALIDAD",
# "PAIS_ORIGEN",
# "UCI"
# "2020-07-28",
# "19d3e0",2,3,"27",2,"27",
# "27",
# "004",1,"2020-05-04",
# "2020-04-29",
# "9999-99-99",97,2,50,1,97,2,2,2,2,2,2,2,2,2,2,2,1,1,99,"México",
# "99",97

$patient_batch = []
$patient_info_batch = []
$patient_total = 0
$start_time = Time.now


def insert_patients
  count = $patient_batch.size
  Patient.insert_all($patient_batch)
  $patient_batch = []
  $patient_total += count
  puts "Inserted #{$patient_total} patients. Elapsed #{Time.now - $start_time}s"
end

def insert_patient_infos
  count = $patient_info_batch.size

  $patient_info_batch.each { |info|
    if !VALID_MUNICIPALITIES.include?(info[:residence_municipality_id])
      puts "Bad municipality #{info[:residence_municipality_id]} (#{info[:patient_id]})"
      clean(info)
    end
  }

  PatientInfo.insert_all($patient_info_batch)
  # puts "Inserted #{count} patient infos"
  $patient_info_batch = []  
end


def clean(patient_info)
  bad_municipality = patient_info[:residence_municipality_id]
  state = bad_municipality / 1000

  patient_info[:residence_municipality_id] = "#{state}999".to_i
end

CSV.foreach(file_name, 'r:ISO-8859-1:UTF-8', headers: true) { |row|
  death_date = if row["FECHA_DEF"] == "9999-99-99"
    nil
  else
    row["FECHA_DEF"]
  end

  now = Time.now

  if ($patient_batch.size >= 2000)
    insert_patients
  end

  if ($patient_info_batch.size >= 2000)
    insert_patient_infos
  end

  $patient_batch << {id: row["ID_REGISTRO"], created_at: now, updated_at: now}

  $patient_info_batch << {
    id: row["ID_REGISTRO"] + '_' + row["FECHA_ACTUALIZACION"],
    patient_id: row["ID_REGISTRO"],
    origin: row["ORIGEN"].to_i,
    sector: row["SECTOR"].to_i,
    hospital_state_id: row["ENTIDAD_UM"].to_i,
    gender: row["SEXO"].to_i,
    birth_state_id: row["ENTIDAD_NAC"].to_i,
    residence_state_id: row["ENTIDAD_RES"].to_i,
    residence_municipality_id: (row["ENTIDAD_RES"] + row["MUNICIPIO_RES"]).to_i,
    hospitalization_date: row["FECHA_INGRESO"],
    symptoms_date: row["FECHA_SINTOMAS"],
    death_date: death_date,
    update_date: row["FECHA_ACTUALIZACION"],
    intubated: row["INTUBADO"].to_i,
    pneumonia: row["NEUMONIA"].to_i,
    age: row["EDAD"].to_i,
    pregnant: row["EMBARAZO"].to_i,
    native_language: row["HABLA_LENGUA_INDIG"].to_i,
    diabetes: row["DIABETES"].to_i,
    epoc: row["EPOC"].to_i,
    asthma: row["ASMA"].to_i,
    immunosuppression: row["INMUSUPR"].to_i,
    hypertension: row["HIPERTENSION"].to_i,
    other_complication: row["OTRA_COM"].to_i,
    cardiovascular: row["CARDIOVASCULAR"].to_i,
    obesity: row["OBESIDAD"].to_i,
    cronic_renal: row["RENAL_CRONICA"].to_i,
    tabaquism: row["TABAQUISMO"].to_i,
    other_case: row["OTRO_CASO"].to_i,
    migrant: row["MIGRANTE"].to_i,
    uci: row["UCI"].to_i,
    nationality: row["NACIONALIDAD"].to_i,
    nationality_country: row["PAIS_NACIONALIDAD"],
    result: row["RESULTADO"].to_i,
    created_at: now,
    updated_at: now
  }
}

insert_patients
insert_patient_infos