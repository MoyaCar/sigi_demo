# Un seguimiento de documentos (actas de infracción, dictamenes, etc)
# relacionados con un caso particular.
class Expediente < ApplicationRecord
  has_many :actas, dependent: :destroy
  has_many :dictamenes, dependent: :destroy
  has_many :adjuntos, as: :adjuntable, dependent: :destroy,
    inverse_of: :adjuntable, autosave: true

  validates :identificador, presence: true, uniqueness: true

  accepts_nested_attributes_for :adjuntos, allow_destroy: true, reject_if: :all_blank
end
