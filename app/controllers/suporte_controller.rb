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

      (CalendarioMes.find_all_by_mmyyyy "#{mes}#{ano}").each_with_index do |mes_ano, i|
        fato_numero_chamados = mes_ano.fato_suporte_chamados_departamentos.group(:departamento).sum(:num_chamados);

        fato_numero_chamados.each_with_index do |chave, i|
          @labels[i] = chave[0].nome
          @values[i] = chave[1]
        end
      end

    elsif !params[:filtro_tipo_chamados].nil?

      unless params[:filtro_tipo_chamados].nil?
        ano = params[:filtro_tipo_chamados][:ano]
      else
        ano = Time.now.year
      end

      unless params[:filtro_tipo_chamados].nil?
        mes = params[:filtro_tipo_chamados][:mes]
      else
        mes = Time.now.month
      end

      @departamentos = Array.new
      @departamentos[1] = "RH"
      @departamentos[2] = "Financeiro"
      @departamentos[3] = "CRM e Marketing"
      @departamentos[4] = "Portal"
      @departamentos[5] = "Suporte e Gestao"
      #@departamentos[6] = "BI"

      @equipamento = Array.new
      @software = Array.new
      @ambiente = Array.new
      @usuario = Array.new
      @manutencao = Array.new
      @outros = Array.new

      fato_tipo_chamados = Array.new

      mes_obj = CalendarioMes.find_by_mmyyyy "#{mes}#{ano}"

      fato_tipo_chamados = mes_obj.fato_suporte_chamados_departamentos

      fato_tipo_chamados.each_with_index do |dado, i|
        
        # definir departamento
        indice = 0

        if dado.departamento.nome == "RH"
          indice = 1
        elsif dado.departamento.nome == "Financeiro"
          indice = 2
        elsif dado.departamento.nome == "CRM e Marketing"
          indice = 3
        elsif dado.departamento.nome == "Portal"
          indice = 4
        elsif dado.departamento.nome == "Suporte e Gestao"
          indice = 5
        # elsif dado.departamento.nome == "BI"
        #   indice = 6
        end

        # definir qual vetor incrementar

        if dado.tipo_chamado.nome == "Pedido de Compra de Equipamento"
          if @equipamento[indice].nil?
            @equipamento[indice] = 0
          end
          @equipamento[indice] = dado.num_chamados.to_i
        elsif dado.tipo_chamado.nome == "Pedido de Compra de Software"
          unless @software[indice]
            @software[indice] = 0
          end
          @software[indice] = dado.num_chamados.to_i
        elsif dado.tipo_chamado.nome == "Indisponibilidade de Ambiente"
          unless @ambiente[indice]
            @ambiente[indice] = 0
          end
          @ambiente[indice] = dado.num_chamados.to_i
        elsif dado.tipo_chamado.nome == "Problema de Usuario"
          unless @usuario[indice]
            @usuario[indice] = 0
          end
          @usuario[indice] = dado.num_chamados.to_i
        elsif dado.tipo_chamado.nome == "Manutencao"
          unless @manutencao[indice]
            @manutencao[indice] = 0
          end
          @manutencao[indice] = dado.num_chamados.to_i
        elsif dado.tipo_chamado.nome == "Outros"
          unless @outros[indice]
            @outros[indice] = 0
          end
          @outros[indice] = dado.num_chamados.to_i
        end
      end
    end
  end

  def chamados_tempos_atendimentos
    puts "PARAMS #{params}"

    if !params[:filtro_tempo_medio_atendimento].nil?

      ano = params[:filtro_tempo_medio_atendimento][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @dados = Hash.new
      @dados[:tempo_atendimento] = Hash.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        tempo_atendimento = data.fato_suporte_tempo_de_atendimentos.sum(:tempo_medio_atendimento)
        @dados[:tempo_atendimento][i.next] = tempo_atendimento
      end

    elsif !params[:filtro_chamados_estourados].nil?

      ano = params[:filtro_chamados_estourados][:ano]
      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]      

      @dados = Hash.new
      @dados[:chamados_estourados] = Array.new
      
      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        chamados_estourados = data.fato_suporte_tempo_de_atendimentos.sum(:num_chamados_estourados)
        @dados[:chamados_estourados][i.next] = chamados_estourados
      end
    end
  end
end
