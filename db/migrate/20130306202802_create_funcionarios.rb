class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.text :motivo_demissao
      t.string :cargo_atual
      t.references :departamento
      t.integer :data_admissao_id
      t.integer :data_demissao_id

      t.timestamps
    end

    add_index :funcionarios, :departamento_id
  end
end
