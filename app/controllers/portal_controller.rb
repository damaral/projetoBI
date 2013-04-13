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
        mes = params[:filtro_5][:mes]

        data = CalendarioMes.find_by_mmyyyy "#{mes}#{ano}"

        fatos = data.fato_portal_curso_empresa_mensals.where("empresa_id = #{empresa.id}")

        @num_estagiarios = Hash.new
        
        fatos.each do |fato|
          unless @num_estagiarios[fato.curso.faculdade].nil?
            @num_estagiarios[fato.curso.faculdade] += fato.fracao_estagiarios.round
          else
            @num_estagiarios[fato.curso.faculdade] = fato.fracao_estagiarios.round
          end
        end

        puts "NUM ESTAGIARIO = #{@num_estagiarios.inspect}" 
       
    end
  end

  def cursos
    puts "PARAMS #{params}"

    if !params[:filtro_1].nil?
      ano = params[:filtro_1][:ano]
      nome_curso = params[:filtro_1][:curso].match /[a-zA-Z]*\s/
      nome_curso = nome_curso.to_s
      nome_curso.slice!(nome_curso.length-1, nome_curso.length)

      curso = Curso.find_by_faculdade nome_curso

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @num_estagiarios_ativos = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_curso_mensal = data.fato_portal_curso_mensals.where("curso_id = #{curso.id}")
        @num_estagiarios_ativos[i.next] = fato_portal_curso_mensal[0].num_estagiario_ativos
      end
    
    elsif !params[:filtro_2].nil?
      ano = params[:filtro_2][:ano]
      nome_curso = params[:filtro_2][:curso].match /[a-zA-Z]*\s/
      nome_curso = nome_curso.to_s
      nome_curso.slice!(nome_curso.length-1, nome_curso.length)

      curso = Curso.find_by_faculdade nome_curso

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @num_estagiarios_contratados = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_curso_mensal = data.fato_portal_curso_mensals.where("curso_id = #{curso.id}")
        @num_estagiarios_contratados[i.next] = fato_portal_curso_mensal[0].num_estagiarios_contratados
      end

    elsif !params[:filtro_3].nil?
      ano = params[:filtro_3][:ano]
      nome_curso = params[:filtro_3][:curso].match /[a-zA-Z]*\s/
      nome_curso = nome_curso.to_s
      nome_curso.slice!(nome_curso.length-1, nome_curso.length)

      curso = Curso.find_by_faculdade nome_curso

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @taxa_de_aceitacao_contrado = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_curso_mensal = data.fato_portal_curso_mensals.where("curso_id = #{curso.id}")
        @taxa_de_aceitacao_contrado[i.next] = fato_portal_curso_mensal[0].taxa_de_aceitacao_contrado
      end

    elsif !params[:filtro_4].nil?
      ano = params[:filtro_4][:ano]
      nome_curso = params[:filtro_4][:curso].match /[a-zA-Z]*\s/
      nome_curso = nome_curso.to_s
      nome_curso.slice!(nome_curso.length-1, nome_curso.length)

      curso = Curso.find_by_faculdade nome_curso

      meses = ["01#{ano}", "02#{ano}","03#{ano}","04#{ano}","05#{ano}","06#{ano}",
             "07#{ano}","08#{ano}","09#{ano}","10#{ano}","11#{ano}","12#{ano}"]

      @salario_medio = Array.new

      meses.each_with_index do |mes, i|
        data = CalendarioMes.find_by_mmyyyy mes
        fato_portal_curso_mensal = data.fato_portal_curso_mensals.where("curso_id = #{curso.id}")
        @salario_medio[i.next] = fato_portal_curso_mensal[0].salario_medio
      end


    end

  end
end