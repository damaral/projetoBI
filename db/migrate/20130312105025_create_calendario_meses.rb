class CreateCalendarioMeses < ActiveRecord::Migration
  def change
    create_table :calendario_meses do |t|
      t.string :mmyyyy
      t.integer :mes
      t.integer :ano

      t.timestamps
    end
  end
end
