class SuporteController < ApplicationController
  def chamados_departamentos
    puts "PARAMS #{params}"


    if !params[:filtro_num_chamados].nil?
      unless params[:filtro_num_chamados].nil?
        ano = params[:filtro_num_chamados][:ano]
      else
        ano = Time.now.year
      end

      unless params[:filtro_num_chamados].nil?
        mes = params[:filtro_num_chamados][:mes]
      else
        mes = Time.now.month
      end

      @labels = Array.new
      @values = Array.new

      (CalendarioMes.find_all_by_mmyyyy "#{mes}#{ano}").each_with_index do |mes, i|
        fato_numero_chamados = mes.fato_suporte_chamados_departamentos.group(:departamento).sum(:num_chamados);

        fato_numero_chamados.each_with_index do |chave, i|
          @labels[i] = chave[0].nome
          @values[i] = chave[1]
        end
      end
    end

  #elsif !params[]
      
  end
end