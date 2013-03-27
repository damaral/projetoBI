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
end