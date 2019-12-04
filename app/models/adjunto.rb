# Un modelo genérico para archivos adjuntos con metadatos, para asociar a
# diferentes modelos.
class Adjunto < ApplicationRecord
  belongs_to :adjuntable, polymorphic: true, touch: true, inverse_of: :adjuntos
  has_one_attached :archivo

  validates :referencia, presence: true
end
