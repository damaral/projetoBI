class CreatePatrimonios < ActiveRecord::Migration
  def change
    create_table :patrimonios do |t|

      t.timestamps
    end
  end
end
