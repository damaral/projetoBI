class CreateFatoSuporteChamadosDepartamentos < ActiveRecord::Migration
  def change
    create_table :fato_suporte_chamados_departamentos do |t|
      t.integer :num_chamados
      t.references :calendario_mes
      t.references :departamento
      t.references :tipo_chamado

      t.timestamps
    end

    add_index :fato_suporte_chamados_departamentos, :calendario_mes_id
    add_index :fato_suporte_chamados_departamentos, :departamento_id
    add_index :fato_suporte_chamados_departamentos, :tipo_chamado_id
  end
end
