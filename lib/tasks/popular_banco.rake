# coding: utf-8

namespace :popular_banco do
  task :dados_teste => :environment do

    ["calendario_meses",
     "fato_rh_produtividades",
     "fato_rh_quantidade_funcionarios"].each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
     end


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
      prod = 10000*rand
      FactoryGirl.create(:fato_rh_produtividade, :calendario_mes => data, :produtividade_real => prod*1.15, :produtividade_total => prod)
    end
    
  end
end