class CreateCalendarios < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
      t.string :ddmmyyyy
      t.string :mmyyyy
      t.integer :dia_ano
      t.integer :dia_semana
      t.integer :semana_ano
      t.integer :mes
      t.integer :ano
      t.integer :dia

      t.timestamps
    end
  end
end
