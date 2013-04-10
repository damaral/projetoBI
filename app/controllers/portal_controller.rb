class PortalController < ApplicationController

  def empresas
    puts "PARAMS #{params}"

    if !params[:filtro_1].nil?
      empresa = Empresa.find_by_nome params[:filtro_1][:empresa]
      ano = params[:filtro_1][:ano]

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @vagas = Array.new
      @contratacoes = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @vagas[i.next] = fato_portal_empresa_mensal[0].num_vagas
        @contratacoes[i.next] = fato_portal_empresa_mensal[0].num_contratacoes
      end
    
    elsif !params[:filtro_2].nil?
      empresa = Empresa.find_by_nome params[:filtro_2][:empresa]
      ano = params[:filtro_2][:ano]

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @num_estagiarios = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @num_estagiarios[i.next] = fato_portal_empresa_mensal[0].num_estagiarios
      end

    elsif !params[:filtro_3].nil?
     empresa = Empresa.find_by_nome params[:filtro_3][:empresa]
      ano = params[:filtro_3][:ano]

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @num_medio_dias_contratacao = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @num_medio_dias_contratacao[i.next] = fato_portal_empresa_mensal[0].num_medio_dias_contratacao.round(2)
      end
      
    elsif !params[:filtro_4].nil?
      empresa = Empresa.find_by_nome params[:filtro_4][:empresa]
      ano = params[:filtro_4][:ano]

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @num_demissoes_voluntarias = Array.new
      @num_demissoes_involuntarias = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @num_demissoes_voluntarias[i.next] = fato_portal_empresa_mensal[0].num_demissoes_voluntarias
        @num_demissoes_involuntarias[i.next] = fato_portal_empresa_mensal[0].num_demissoes_involuntarias
      end

    elsif !params[:filtro_5].nil?
      empresa = Empresa.find_by_nome params[:filtro_5][:empresa]
      ano = params[:filtro_5][:ano]

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @vagas = Array.new
      @contratacoes = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @vagas[i.next] = fato_portal_empresa_mensal[0].num_vagas
        @contratacoes[i.next] = fato_portal_empresa_mensal[0].num_contratacoes
      end
    end

  end

  def cursos
    puts "PARAMS #{params}"

    if !params[:filtro_1].nil?
      ano = params[:filtro_1][:ano]
      mes = params[:filtro_1][:mes]

      @departamentos = Array.new
      @despesas = Array.new

      data = CalendarioMes.find_by_mmyyyy "#{mes}#{ano}"

      data.fato_financeiro_despesas.each_with_index do |dado, i|
        indice = i.next
        @departamentos[indice] = dado.departamento.nome
        @despesas[indice] = dado.despesa_total.round(2)

      end
    
    elsif !params[:filtro_2].nil?
      ano = params[:filtro_2][:ano]
      mes = params[:filtro_2][:mes]

      @departamentos = Array.new
      @salarios = Array.new
      @infra = Array.new
      @treinamento = Array.new
      @outros = Array.new

      data = CalendarioMes.find_by_mmyyyy "#{mes}#{ano}"

      data.fato_financeiro_despesas.each_with_index do |dado, i|
        indice = i.next
        @departamentos[indice] = dado.departamento.nome
        @salarios[indice] = dado.salario_total.round(2)
        @infra[indice] = dado.custo_infraestrutura.round(2)
        @treinamento[indice] = dado.custo_treinamento.round(2)
        @outros[indice] = dado.custo_outros.round(2)

      end

    end

  end
end