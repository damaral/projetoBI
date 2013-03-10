class CreateHistoricoDepartamentos < ActiveRecord::Migration
  def change
    create_table :historico_departamentos do |t|
      t.integer :mes
      t.float :orcamento_previsto
      t.references :departamento

      t.timestamps
    end

    add_index :historico_departamentos, :departamento_id
  end
end
