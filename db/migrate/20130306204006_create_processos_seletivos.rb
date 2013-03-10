class CreateProcessosSeletivos < ActiveRecord::Migration
  def change
    create_table :processos_seletivos do |t|
      t.references :estagiario
      t.references :vaga

      t.timestamps
    end

    add_index :processos_seletivos, :estagiario_id
    add_index :processos_seletivos, :vaga_id
  end
end
