# Modelo para manejar Actas de infracción.
class Acta < ApplicationRecord
  belongs_to :expediente, optional: true
  belongs_to :tipo_de_infraccion, optional: true
  has_many :descargos, dependent: :destroy
  has_many :adjuntos, as: :adjuntable, dependent: :destroy,
    inverse_of: :adjuntable, autosave: true

  validates :numero, presence: true, uniqueness: true
  validates :estado, presence: true

  accepts_nested_attributes_for :adjuntos, allow_destroy: true, reject_if: :all_blank

  before_save :registrar_fecha_de_asociacion

  private

  # Guarda o nulifica la fecha de asociación de este Acta con un Expediente.
  def registrar_fecha_de_asociacion
    self.fecha_de_asociacion = expediente.present? ? DateTime.current : nil
  end
end
