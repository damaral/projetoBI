class CreateFatoSuporteTempoDeAtendimentos < ActiveRecord::Migration
  def change
    create_table :fato_suporte_tempo_de_atendimentos do |t|
      t.float :tempo_medio_atendimento
      t.integer :num_chamados_estourados
      t.references :calendario_mes
      t.references :departamento
      t.references :tipo_chamado

      t.timestamps
    end

    add_index :fato_suporte_tempo_de_atendimentos, :calendario_mes_id
    add_index :fato_suporte_tempo_de_atendimentos, :departamento_id
    add_index :fato_suporte_tempo_de_atendimentos, :tipo_chamado_id
  end
end
