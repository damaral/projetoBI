class CreateEstagiarios < ActiveRecord::Migration
  def change
    create_table :estagiarios do |t|
      t.string :nome
      t.string :email
      t.integer :ano_atual
      t.integer :ano_previsto_formacao

      t.timestamps
    end
  end
end
