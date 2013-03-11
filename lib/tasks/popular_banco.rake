# coding: utf-8

namespace :popular_banco do
  task :dados_teste => :environment do

    ["departamentos;",
     "historico_departamentos;",
     "funcionarios;",
     "historico_funcionarios;",
     "receitas;",
     "despesas;",
     "chamados;",
     "patrimonios;",
     "campanhas;",
     "atendimento_clientes;",
     "estagios;",
     "vagas;",
     "estagiarios;",
     "processos_seletivos",
     "calendarios"].each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
     end

    data = Array.new
    data.push FactoryGirl.create(:calendario, :mmyyyy => "012013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "022013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "032013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "042013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "052013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "062013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "072013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "082013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "092013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "102013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "112013", :ano => 2013)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "122013", :ano => 2013)

    data.push FactoryGirl.create(:calendario, :mmyyyy => "012012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "022012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "032012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "042012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "052012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "062012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "072012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "082012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "092012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "102012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "112012", :ano => 2012)
    data.push FactoryGirl.create(:calendario, :mmyyyy => "122012", :ano => 2012)
    

    FactoryGirl.create(:funcionario, :nome => "Func 1", :data_admissao => data[13])
    FactoryGirl.create(:funcionario, :nome => "Func 2", :data_admissao => data[15])
    FactoryGirl.create(:funcionario, :nome => "Func 3", :data_admissao => data[3])
    FactoryGirl.create(:funcionario, :nome => "Func 4", :data_admissao => data[4])

    data.each do |data|
        5.times do |j|
            rand(j)
            valor = 27.35*rand
            FactoryGirl.create(:receita, :calendario => data, :valor => valor)
        end
    end
    
  end
end