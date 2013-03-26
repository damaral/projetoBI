class RhController < ApplicationController
  def relatorio_kpis
    puts "PARAMS #{params}"

    unless params[:filtros].nil?
      ano = params[:filtros][:ano]
    else
      ano = Time.now.year
    end

    if !params[:filtro_prod].nil?
      ano = params[:filtro_prod][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @dados = Hash.new
      @dados[:produtividade_total] = Hash.new
      @dados[:produtividade_real] = Hash.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_rh_produtividade = data.fato_rh_produtividade
        @dados[:produtividade_total][i.next] = fato_rh_produtividade.produtividade_total.round(2)
        @dados[:produtividade_real][i.next] = fato_rh_produtividade.produtividade_real.round(2)
      end
    elsif !params[:filtro_quant].nil?
      ano = params[:filtro_quant][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]      

      
    end

  end
end