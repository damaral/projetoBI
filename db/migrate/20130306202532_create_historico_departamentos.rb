class CreateHistoricoDepartamentos < ActiveRecord::Migration
  def change
    create_table :historico_departamentos do |t|
      t.integer :mes
      t.float :orcamento_previsto

      t.timestamps
    end
  end
end
