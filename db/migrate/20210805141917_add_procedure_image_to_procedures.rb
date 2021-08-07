class AddProcedureImageToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :procedure_image, :string
  end
end
