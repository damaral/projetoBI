class CreateVagas < ActiveRecord::Migration
  def change
    create_table :vagas do |t|
      t.string :cargo
      t.float :bolsa

      t.timestamps
    end
  end
end
