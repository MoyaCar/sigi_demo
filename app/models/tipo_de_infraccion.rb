class TipoDeInfraccion < ApplicationRecord
  has_many :actas, dependent: :restrict_with_error

  validates :identificador, presence: true, uniqueness: true

  # TODO Si armamos decoradores, pasar este método allí.
  def to_s
    identificador
  end
end
