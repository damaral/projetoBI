class CrmController < ApplicationController
  require 'rest_client'
  def relatorio_kpis
    puts "PARAMS #{params}"
    @dados = Array.new

    crm_etl

    if !params[:filtro_cac].nil?
      ano = params[:filtro_cac][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        @dados[i.next] = data.fato_crm_kpi.cac.round(2)
      end

    elsif !params[:filtro_roi].nil?
      ano = params[:filtro_roi][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        @dados[i.next] = data.fato_crm_kpi.roi.round(2)
      end

    elsif !params[:filtro_campanha].nil?
      ano = params[:filtro_campanha][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        @dados[i.next] = data.fato_crm_kpi.receita_por_campanha
      end

    end

  end

  def relatorio_sac_emails_motivo
    puts "PARAMS #{params}"

      @labels = Array.new
      @values = Array.new



    if !params[:filtro_total].nil?
      ano = params[:filtro_total][:ano]
      mes = params[:filtro_total][:mes]

      motivos = Array.new

      (CalendarioMes.find_all_by_mmyyyy "#{mes}#{ano}").each_with_index do |mes, i|
        sacs = mes.fato_crm_sacs
        sacs.each_with_index do |sac, j|
          j.next
          @labels[j] = sac.motivo.nome
          @values[j] = sac.total_email_recebidos
        end
      end

    elsif !params[:filtro_tempo_medio].nil?
      ano = params[:filtro_tempo_medio][:ano]
      mes = params[:filtro_tempo_medio][:mes]

      tempo_medio = Array.new
      
      (CalendarioMes.find_all_by_mmyyyy "#{mes}#{ano}").each_with_index do |mes, i|
        sacs = mes.fato_crm_sacs
        sacs.each_with_index do |sac, j|
          j.next
          @labels[j] = sac.motivo.nome
          @values[j] = sac.tempo_medio_atendimento
        end
      end
    end
  end

  def crm_etl
    strJson = RestClient.get 'http://localhost:3001/support_cases.json'
    json = JSON.parse strJson
    
    ActiveRecord::Base.connection.execute("TRUNCATE fato_crm_sacs")

    emails = Array.new

    json.each do |j|
      if(Motivo.find_by_nome(j["caseType"]).nil?)
        FactoryGirl.create(:motivo, :nome => j["caseType"], :descricao => j["description"])
      end

      data = j["created_at"].to_time
      strData = (data.month<10) ? "0#{data.month}#{data.year}" : "#{data.month}#{data.year}"
      
      # if (FatoCrmSac.find_by_mmyyyy(strData).nil?)
      # end
      
      puts strData
    end
  end

  def kpi_etl
    strJson = RestClient.get 'http://localhost:3001/marketing_campaigns.json'
    json = JSON.parse strJson
    
    ActiveRecord::Base.connection.execute("TRUNCATE fato_crm_kpis")

    marketing_campaigns = Array.new
    json.each do |j|
      if(not j['end_date'].nil?)
        marketing_campaign = MarketingCampaign.new

        marketing_campaign.end_date = j['end_date']

        if(not j['revenue'].nil?)
          marketing_campaign.revenue = j['revenue']
        else
          marketing_campaign.revenue = 0
        end

        if(not j['value'].nil?)
          marketing_campaign.value = j['value']
        else
          marketing_campaign.value = 0
        end

        puts marketing_campaign.end_date
        puts marketing_campaign.revenue
        puts marketing_campaign.value

        marketing_campaigns << marketing_campaign
      end
    end

    meses = CalendarioMes.all
    meses.each do |mes|
      fato = FatoCrmKpi.new
      fato.calendario_mes = mes

      fato.despesas_marketing = 0
      fato.numero_de_campanhas = 0
      fato.receita_adquirida = 0
      fato.receita_por_campanha = 0
      fato.roi = 0
      
      marketing_campaigns.each do |marketing_campaign|
        if(mes.ano == marketing_campaign.end_date.to_time.year && mes.mes == marketing_campaign.end_date.to_time.month)
          fato.despesas_marketing += marketing_campaign.value.to_f
          fato.receita_adquirida += marketing_campaign.revenue.to_f
          fato.numero_de_campanhas += 1
        end
      end

      if(fato.numero_de_campanhas > 0)
        if(fato.despesas_marketing > 0)
          roi = fato.receita_adquirida / fato.despesas_marketing
        end

        fato.receita_por_campanha = fato.receita_adquirida / fato.numero_de_campanhas
      end

      fato.save
    end

    kpi_clients_etl

    redirect_to :action => 'relatorio_kpis'
  end

  def kpi_clients_etl
    strJson = RestClient.get 'http://192.168.1.82:3000/webservices/empresas'
    json = JSON.parse strJson

    clients = Array.new
    json.each do |j|
      if(not j['created_at'].nil?)
        clients << j['created_at']

        puts j['created_at']
      end
    end

    FatoCrmKpi.all.each do |kpi|
      mes = kpi.calendario_mes
      kpi.clientes_adquiridos = 0
      clients.each do |c|
        if(c.to_time.year == mes.ano && c.to_time.month == mes.mes)
          kpi.clientes_adquiridos += 1
        end
      end

      puts kpi.despesas_marketing
      puts kpi.clientes_adquiridos

      if(kpi.clientes_adquiridos > 0)
        kpi.cac = kpi.despesas_marketing / kpi.clientes_adquiridos
      else
        kpi.cac = 0
      end

      kpi.save
    end
  end
end