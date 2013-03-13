class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :faculdade

      t.timestamps
    end
  end
end
