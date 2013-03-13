class CreateFatoRhQuantidadeFuncionarios < ActiveRecord::Migration
  def change
    create_table :fato_rh_quantidade_funcionarios do |t|
      t.integer :quantidade_funcionarios
      t.float :salario_total
      t.float :orcamento_previsto
      t.float :orcamento_disponivel
      t.references :calendario_mes
      t.references :departamento

      t.timestamps
    end

    add_index :fato_rh_quantidade_funcionarios, :calendario_mes_id
    add_index :fato_rh_quantidade_funcionarios, :departamento_id
  end
end
