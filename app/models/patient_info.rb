YES_NO = {
  is: 1, is_not: 2, not_applicable: 97, unknown: 98, not_specified: 99
}

class PatientInfo < ApplicationRecord
  belongs_to :patient
  belongs_to :hospital_state, class_name: 'State'
  belongs_to :birth_state, class_name: 'State'
  belongs_to :residence_state, class_name: 'State'
  belongs_to :residence_municipality, class_name: 'Municipality'

  enum origin: { usmer: 1, outside_usmer: 2, not_specified: 99 }, _suffix: true

  enum sector: { 
    cruz_roja: 1,
    dif: 2,
    estatal: 3,
    imss: 4,
    imss_bienestar: 5,
    issste: 6,
    municipal: 7,
    pemex: 8,
    private: 9,
    sedena: 10,
    semar: 11,
    ssa: 12,
    university: 13,
    not_specified: 99
  }, _suffix: true

  enum gender: {
    female: 1,
    male: 2,
    not_specified: 99
  }

  enum result: {
    positive: 1,
    negative: 2,
    pending: 3
  }, _suffix: true

  enum nationality: {
    mexican: 1,
    foreigner: 2,
    not_specified: 99
  }, _suffix: true
  

  enum intubated: YES_NO, _suffix: true
  enum pneumonia: YES_NO, _suffix: true
  enum pregnant: YES_NO, _suffix: true
  enum native_language: YES_NO, _suffix: true
  enum diabetes: YES_NO, _suffix: true
  enum epoc: YES_NO, _suffix: true
  enum asthma: YES_NO, _suffix: true
  enum immunosuppression: YES_NO, _suffix: true
  enum hypertension: YES_NO, _suffix: true
  enum other_complication: YES_NO, _suffix: true
  enum cardiovascular: YES_NO, _suffix: true
  enum obesity: YES_NO, _suffix: true
  enum cronic_renal: YES_NO, _suffix: true
  enum tabaquism: YES_NO, _suffix: true
  enum other_case: YES_NO, _suffix: true
  enum migrant: YES_NO, _suffix: true
  enum uci: YES_NO, _suffix: true
end
