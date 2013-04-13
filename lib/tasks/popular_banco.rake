# coding: utf-8

namespace :popular_banco do
  task :dados_teste => :environment do

    ["calendario_meses",
    "fato_crm_kpis", 
    "fato_crm_sacs", 
    "motivos",
    "departamentos",
    "fato_rh_produtividades",
    "fato_financeiro_demonstrativos",
    "fato_rh_quantidade_funcionarios",
    "fato_financeiro_despesas"].each do |table|

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
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "01#{ano}", :ano => ano, :mes => "01")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "02#{ano}", :ano => ano, :mes => "02")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "03#{ano}", :ano => ano, :mes => "03")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "04#{ano}", :ano => ano, :mes => "04")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "05#{ano}", :ano => ano, :mes => "05")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "06#{ano}", :ano => ano, :mes => "06")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "07#{ano}", :ano => ano, :mes => "07")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "08#{ano}", :ano => ano, :mes => "08")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "09#{ano}", :ano => ano, :mes => "09")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "10#{ano}", :ano => ano, :mes => "10")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "11#{ano}", :ano => ano, :mes => "11")
      data_mes.push FactoryGirl.create(:calendario_mes, :mmyyyy => "12#{ano}", :ano => ano, :mes => "12")
    end



    cac = 500
    roi = 1200
    receita_por_campanha = 35000

    departamentos = Array.new
    departamentos_nomes = ["RH", "Financeiro", "CRM e Marketing", "Portal", "Suporte e Gestão"] 
    departamentos_nomes.each do |nome|
      departamentos.push FactoryGirl.create(:departamento, :nome => nome)
    end


    data_mes.each_with_index do |data, j|
      cac = cac*0.95
      roi = roi*1.01
      receita_por_campanha = receita_por_campanha*1.013

      rand(j)
      prod = 10000*rand
      FactoryGirl.create(:fato_rh_produtividade, :calendario_mes => data, :produtividade_real => prod*1.15, :produtividade_total => prod)

      FactoryGirl.create(:fato_crm_kpi, :calendario_mes => data, :cac => cac, :roi => roi, :receita_por_campanha =>receita_por_campanha)
      

      motivos.each_with_index do |motivo, i|

        FactoryGirl.create(:fato_crm_sac, :calendario_mes => data, :motivo => motivo, :tempo_medio_atendimento => data.ano/1000 + (data.mes/1.5)*i, :total_email_recebidos => data.ano-1980 + data.mes*i, :total_emails_respondidos => 38)
      end 
      


      receita = 100000*rand
      FactoryGirl.create(:fato_financeiro_demonstrativo, :calendario_mes => data, :receita_total => receita, :custos_variaveis => receita*0.10,
       :custos_fixos => receita*0.45, :impostos => receita*0.25, :lucro => receita*0.2)

      departamentos.each_with_index do |departamento, d|
        
        salario_total = 50000*rand
        custo_infraestrutura = 35000*rand
        custo_treinamento = 15000*rand
        custo_outros = 20000*rand
        despesa_total = salario_total + custo_infraestrutura + custo_treinamento + custo_outros

        despesa = 10000*rand
        FactoryGirl.create(:fato_financeiro_despesa, :calendario_mes => data, :departamento => departamento, :despesa_total => despesa_total,
          :salario_total => salario_total, :custo_infraestrutura => custo_infraestrutura, :custo_treinamento => custo_treinamento, 
          :custo_outros => custo_outros)

        FactoryGirl.create(:fato_rh_quantidade_funcionario, :quantidade_funcionarios => (rand*25).to_i, :salario_total => rand*50000, :orcamento_previsto => rand*80000, 
                           :orcamento_disponivel => rand*80000, :departamento => departamento, :calendario_mes => data)
      end

    end
    
  end
end