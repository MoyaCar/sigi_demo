# El dictamen del EMOP sobre un expediente.
class Dictamen < ApplicationRecord
  belongs_to :expediente
  has_one :resolucion, dependent: :destroy

  has_rich_text :texto

  validates :identificador, presence: true, uniqueness: { scope: :expediente_id }
end
