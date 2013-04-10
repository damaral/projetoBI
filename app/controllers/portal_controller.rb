class PortalController < ApplicationController
  


  def empresas
    puts "PARAMS #{params}"

    if !params[:filtro_1].nil?
      empresa = Empresa.find_by_nome params[:filtro_1][:empresa]
      ano = params[:filtro_1][:ano]

      @vagas = Array.new
      @contratacoes = Array.new

        @@meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @@meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_empresa_mensal = data.fato_portal_empresa_mensals.where("empresa_id = #{empresa.id}")
        @vagas[i.next] = fato_portal_empresa_mensal[0].num_vagas.round(2)
        @contratacoes[i.next] = fato_portal_empresa_mensal[0].num_contratacoes.round(2)

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

    elsif !params[:filtro_3].nil?
      ano = params[:filtro_3][:ano]
      mes = params[:filtro_3][:mes]

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
      
    elsif !params[:filtro_4].nil?
      ano = params[:filtro_4][:ano]
      mes = params[:filtro_4][:mes]

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

    elsif !params[:filtro_5].nil?
      ano = params[:filtro_5][:ano]
      mes = params[:filtro_5][:mes]

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