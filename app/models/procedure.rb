class Procedure < ApplicationRecord

  belongs_to	:recipe
  mount_uploader :procedure_image, ProcedureImageUploader
  validates :explanation, presence: true

end
