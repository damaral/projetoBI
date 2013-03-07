class CreateHistoricoFuncionarios < ActiveRecord::Migration
  def change
    create_table :historico_funcionarios do |t|
      t.string :cargo_antigo
      t.string :cargo_novo
      t.float :salario_antigo
      t.float :salario_novo

      t.timestamps
    end
  end
end
