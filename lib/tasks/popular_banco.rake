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
    data.push FactoryGirl.create(:calendario, :mmyyyy => "012013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "022013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "032013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "042013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "052013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "062013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "072013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "082013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "092013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "102013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "112013")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "122013")

    data.push FactoryGirl.create(:calendario, :mmyyyy => "012014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "022014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "032014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "042014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "052014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "062014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "072014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "082014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "092014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "102014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "112014")
    data.push FactoryGirl.create(:calendario, :mmyyyy => "122014")
    

    FactoryGirl.create(:funcionario, :nome => "Func 1", :data_admissao => data[1])
    FactoryGirl.create(:funcionario, :nome => "Func 2", :data_admissao => data[2])
    FactoryGirl.create(:funcionario, :nome => "Func 3", :data_admissao => data[3])
    FactoryGirl.create(:funcionario, :nome => "Func 4", :data_admissao => data[4])

    data.each do |data|
        5.times do
            FactoryGirl.create(:receita, :calendario => data)
        end
    end
    
  end
end