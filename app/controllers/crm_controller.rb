class CrmController < ApplicationController
  def relatorio_kpis
    puts "PARAMS #{params}"

    @dados = Array.new

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
end