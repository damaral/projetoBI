class CreateFatoCrmSacs < ActiveRecord::Migration
  def change
    create_table :fato_crm_sacs do |t|
      t.integer :total_email_recebidos
      t.integer :total_emails_respondidos
      t.float :tempo_medio_atendimento
      t.references :calendario_mes
      t.references :motivo

      t.timestamps
    end

    add_index :fato_crm_sacs, :calendario_mes_id
    add_index :fato_crm_sacs, :motivo_id
  end
end
