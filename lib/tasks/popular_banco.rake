# coding: utf-8

namespace :popular_banco do
  task :dados_teste => :environment do

    ["calendario_meses",
     "fato_rh_produtividades", "fato_crm_kpis", "fato_crm_sacs", "motivos", ].each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
     end

    motivos = Array.new
    motivos.push FactoryGirl.create(:motivo, :nome => "Demora no atendimento", :descricao => "Alipio corporativo")
    motivos.push FactoryGirl.create(:motivo, :nome => "Insatisfação com a qualidade do serviço", :descricao => "Bar das tetas")
    motivos.push FactoryGirl.create(:motivo, :nome => "Dificuldade em cancelar o convênio", :descricao => "Lista de interessadis")
    motivos.push FactoryGirl.create(:motivo, :nome => "Falta de informações", :descricao => "Bog")
    motivos.push FactoryGirl.create(:motivo, :nome => "Outros", :descricao => "Dan Carai")



    data_mes = Array.new
    anos = [2009, 2010, 2011, 2012, 2013]

    anos.each_with_index do |ano, i|
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "01#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "02#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "03#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "04#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "05#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "06#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "07#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "08#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "09#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "10#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "11#{ano}", :ano => ano, :mes => i.next)
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "12#{ano}", :ano => ano, :mes => i.next)
    end

    data_mes.each_with_index do |data, j|
      rand(j)
      cac = 100*rand
      prod = 10000*rand
      FactoryGirl.create(:fato_rh_produtividade, :calendario_mes => data, :produtividade_real => prod*1.15, :produtividade_total => prod)
      FactoryGirl.create(:fato_crm_kpi, :calendario_mes => data, :cac => cac*1.15)

      motivos.each_with_index do |motivo, i|
        FactoryGirl.create(:fato_crm_sac, :calendario_mes => data, :motivo => motivo, :tempo_medio_atendimento => 4, :total_email_recebidos => 50, :total_emails_respondidos => 38)
      end 
      
    end
    
  end
end