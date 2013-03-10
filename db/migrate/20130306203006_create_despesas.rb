class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.float :valor
      t.text :descricao
      t.references :departamento

      t.timestamps
    end

    add_index :despesas, :departamento_id
  end
end
