class CreateVagas < ActiveRecord::Migration
  def change
    create_table :vagas do |t|
      t.string :cargo
      t.float :bolsa
      t.references :cliente

      t.timestamps
    end

    add_index :vagas, :cliente_id
  end
end
