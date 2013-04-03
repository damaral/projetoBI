class FinanceiroController < ApplicationController
  def lucros_perdas
    puts "PARAMS #{params}"

    unless params[:filtros].nil?
      ano = params[:filtros][:ano]
    else
      ano = Time.now.year
    end

    meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]
    @receita = Array.new
    @custos_variaveis = Array.new
    @custos_fixos = Array.new
    @impostos = Array.new
    @lucros = Array.new


    meses.each_with_index do |mes, i|
      data = CalendarioMes.find_by_mmyyyy mes
      indice = i.next
      @receita[indice] = data.fato_financeiro_demonstrativo.receita_total.round(2)
      @custos_variaveis[indice] = data.fato_financeiro_demonstrativo.custos_variaveis.round(2)
      @custos_fixos[indice] = data.fato_financeiro_demonstrativo.custos_fixos.round(2)  
      @impostos[indice] = data.fato_financeiro_demonstrativo.impostos.round(2)  
      @lucros[indice] = data.fato_financeiro_demonstrativo.lucro.round(2)      
    end

  end

  def despesas_detalhadas
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