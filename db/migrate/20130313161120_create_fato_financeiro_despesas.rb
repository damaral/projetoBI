class CreateFatoFinanceiroDespesas < ActiveRecord::Migration
  def change
    create_table :fato_financeiro_despesas do |t|
      t.float :despesa_total
      t.float :salario_total
      t.float :custo_infraestrutura
      t.float :custo_treinamento
      t.float :custo_outros
      t.references :calendario_mes
      t.references :departamento

      t.timestamps
    end

    add_index :fato_financeiro_despesas, :calendario_mes_id
    add_index :fato_financeiro_despesas, :departamento_id
  end
end
