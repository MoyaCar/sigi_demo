# La resolución de un dictamen.
class Resolucion < ApplicationRecord
  belongs_to :dictamen

  has_rich_text :observacion
end
