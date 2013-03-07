class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.text :motivo_demissao
      t.string :cargo_atual

      t.timestamps
    end
  end
end
