class CreateAtendimentoClientes < ActiveRecord::Migration
  def change
    create_table :atendimento_clientes do |t|
      t.text :mensagem_recebida
      t.text :mensagem_enviada

      t.timestamps
    end
  end
end
