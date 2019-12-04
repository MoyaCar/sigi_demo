# El descargo que realiza un usuario sobre un Acta de infracción.
class Descargo < ApplicationRecord
  belongs_to :acta
  belongs_to :user

  has_rich_text :texto
end
