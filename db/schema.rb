# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130313173317) do

  create_table "calendario_meses", :force => true do |t|
    t.string   "mmyyyy"
    t.integer  "mes"
    t.integer  "ano"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cursos", :force => true do |t|
    t.string   "nome"
    t.string   "faculdade"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departamentos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fato_crm_kpis", :force => true do |t|
    t.float    "receita_adquirida"
    t.integer  "clientes_adquiridos"
    t.float    "cac"
    t.float    "despesas_marketing"
    t.float    "roi"
    t.integer  "numero_de_campanhas"
    t.float    "receita_por_campanha"
    t.integer  "calendario_mes_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "fato_crm_kpis", ["calendario_mes_id"], :name => "index_fato_crm_kpis_on_calendario_mes_id"

  create_table "fato_crm_sacs", :force => true do |t|
    t.integer  "total_email_recebidos"
    t.integer  "total_emails_respondidos"
    t.float    "tempo_medio_atendimento"
    t.integer  "calendario_mes_id"
    t.integer  "motivo_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "fato_crm_sacs", ["calendario_mes_id"], :name => "index_fato_crm_sacs_on_calendario_mes_id"
  add_index "fato_crm_sacs", ["motivo_id"], :name => "index_fato_crm_sacs_on_motivo_id"

  create_table "fato_financeiro_demonstrativos", :force => true do |t|
    t.float    "receita_total"
    t.float    "custos_variaveis"
    t.float    "custos_fixos"
    t.float    "impostos"
    t.float    "lucro"
    t.integer  "calendario_mes_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "fato_financeiro_demonstrativos", ["calendario_mes_id"], :name => "index_fato_financeiro_demonstrativos_on_calendario_mes_id"

  create_table "fato_financeiro_despesas", :force => true do |t|
    t.float    "despesa_total"
    t.float    "salario_total"
    t.float    "custo_infraestrutura"
    t.float    "custo_treinamento"
    t.float    "custo_outros"
    t.integer  "calendario_mes_id"
    t.integer  "departamento_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "fato_financeiro_despesas", ["calendario_mes_id"], :name => "index_fato_financeiro_despesas_on_calendario_mes_id"
  add_index "fato_financeiro_despesas", ["departamento_id"], :name => "index_fato_financeiro_despesas_on_departamento_id"

  create_table "fato_portal_curso_empresa_mensals", :force => true do |t|
    t.float    "fracao_estagiarios"
    t.integer  "calendario_mes_id"
    t.integer  "empresa_id"
    t.integer  "curso_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "fato_portal_curso_empresa_mensals", ["calendario_mes_id"], :name => "index_fato_portal_curso_empresa_mensals_on_calendario_mes_id"
  add_index "fato_portal_curso_empresa_mensals", ["curso_id"], :name => "index_fato_portal_curso_empresa_mensals_on_curso_id"
  add_index "fato_portal_curso_empresa_mensals", ["empresa_id"], :name => "index_fato_portal_curso_empresa_mensals_on_empresa_id"

  create_table "fato_portal_curso_mensals", :force => true do |t|
    t.integer  "num_estagiarios_contratados"
    t.float    "taxa_de_aceitacao_contrado"
    t.integer  "num_estagiario_ativos"
    t.integer  "calendario_mes_id"
    t.integer  "curso_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "fato_portal_curso_mensals", ["calendario_mes_id"], :name => "index_fato_portal_curso_mensals_on_calendario_mes_id"
  add_index "fato_portal_curso_mensals", ["curso_id"], :name => "index_fato_portal_curso_mensals_on_curso_id"

  create_table "fato_portal_empresa_anuals", :force => true do |t|
    t.float    "salario_medio"
    t.integer  "calendario_mes_id"
    t.integer  "empresa_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "fato_portal_empresa_anuals", ["calendario_mes_id"], :name => "index_fato_portal_empresa_anuals_on_calendario_mes_id"
  add_index "fato_portal_empresa_anuals", ["empresa_id"], :name => "index_fato_portal_empresa_anuals_on_empresa_id"

  create_table "fato_portal_empresa_mensals", :force => true do |t|
    t.integer  "num_vagas"
    t.integer  "num_contratacoes"
    t.integer  "num_estagiarios"
    t.float    "num_medio_dias_contratacao"
    t.integer  "num_demissoes_voluntarias"
    t.integer  "num_demissoes_involuntarias"
    t.integer  "empresa_id"
    t.integer  "calendario_mes_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "fato_portal_empresa_mensals", ["calendario_mes_id"], :name => "index_fato_portal_empresa_mensals_on_calendario_mes_id"
  add_index "fato_portal_empresa_mensals", ["empresa_id"], :name => "index_fato_portal_empresa_mensals_on_empresa_id"

  create_table "fato_rh_produtividades", :force => true do |t|
    t.float    "receita_total"
    t.integer  "num_estagiarios"
    t.integer  "num_funcionarios"
    t.float    "produtividade_total"
    t.float    "produtividade_real"
    t.integer  "calendario_mes_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "fato_rh_produtividades", ["calendario_mes_id"], :name => "index_fato_rh_produtividades_on_calendario_mes_id"

  create_table "fato_rh_quantidade_funcionarios", :force => true do |t|
    t.integer  "quantidade_funcionarios"
    t.float    "salario_total"
    t.float    "orcamento_previsto"
    t.float    "orcamento_disponivel"
    t.integer  "calendario_mes_id"
    t.integer  "departamento_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "fato_rh_quantidade_funcionarios", ["calendario_mes_id"], :name => "index_fato_rh_quantidade_funcionarios_on_calendario_mes_id"
  add_index "fato_rh_quantidade_funcionarios", ["departamento_id"], :name => "index_fato_rh_quantidade_funcionarios_on_departamento_id"

  create_table "fato_suporte_chamados_departamentos", :force => true do |t|
    t.integer  "num_chamados"
    t.integer  "calendario_mes_id"
    t.integer  "departamento_id"
    t.integer  "tipo_chamado_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "fato_suporte_chamados_departamentos", ["calendario_mes_id"], :name => "index_fato_suporte_chamados_departamentos_on_calendario_mes_id"
  add_index "fato_suporte_chamados_departamentos", ["departamento_id"], :name => "index_fato_suporte_chamados_departamentos_on_departamento_id"
  add_index "fato_suporte_chamados_departamentos", ["tipo_chamado_id"], :name => "index_fato_suporte_chamados_departamentos_on_tipo_chamado_id"

  create_table "fato_suporte_tempo_de_atendimentos", :force => true do |t|
    t.float    "tempo_medio_atendimento"
    t.integer  "num_chamados_estourados"
    t.integer  "calendario_mes_id"
    t.integer  "departamento_id"
    t.integer  "tipo_chamado_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "fato_suporte_tempo_de_atendimentos", ["calendario_mes_id"], :name => "index_fato_suporte_tempo_de_atendimentos_on_calendario_mes_id"
  add_index "fato_suporte_tempo_de_atendimentos", ["departamento_id"], :name => "index_fato_suporte_tempo_de_atendimentos_on_departamento_id"
  add_index "fato_suporte_tempo_de_atendimentos", ["tipo_chamado_id"], :name => "index_fato_suporte_tempo_de_atendimentos_on_tipo_chamado_id"

  create_table "motivos", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_chamados", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
