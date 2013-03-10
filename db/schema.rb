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

ActiveRecord::Schema.define(:version => 20130306204235) do

  create_table "atendimento_clientes", :force => true do |t|
    t.text     "mensagem_recebida"
    t.text     "mensagem_enviada"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "calendarios", :force => true do |t|
    t.string   "ddmmyyyy"
    t.string   "mmyyyy"
    t.integer  "dia_ano"
    t.integer  "dia_semana"
    t.integer  "semana_ano"
    t.integer  "mes"
    t.integer  "ano"
    t.integer  "dia"
    t.date     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campanhas", :force => true do |t|
    t.string   "tipo"
    t.string   "nome"
    t.integer  "despesa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "campanhas", ["despesa_id"], :name => "index_campanhas_on_despesa_id"

  create_table "chamados", :force => true do |t|
    t.string   "status"
    t.integer  "funcionario_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "chamados", ["funcionario_id"], :name => "index_chamados_on_funcionario_id"

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "tipo_cliente"
    t.string   "cnpj"
    t.integer  "campanha_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "clientes", ["campanha_id"], :name => "index_clientes_on_campanha_id"

  create_table "departamentos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "despesas", :force => true do |t|
    t.float    "valor"
    t.text     "descricao"
    t.integer  "departamento_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "despesas", ["departamento_id"], :name => "index_despesas_on_departamento_id"

  create_table "estagiarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "ano_atual"
    t.integer  "ano_previsto_formacao"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "estagios", :force => true do |t|
    t.float    "bolsa"
    t.integer  "estagiario_id"
    t.integer  "cliente_empresa_id"
    t.integer  "cliente_instituicao_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "estagios", ["cliente_empresa_id"], :name => "index_estagios_on_cliente_empresa_id"
  add_index "estagios", ["cliente_instituicao_id"], :name => "index_estagios_on_cliente_instituicao_id"

  create_table "funcionarios", :force => true do |t|
    t.string   "nome"
    t.text     "motivo_demissao"
    t.string   "cargo_atual"
    t.integer  "departamento_id"
    t.integer  "data_admissao_id"
    t.integer  "data_demissao_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "funcionarios", ["departamento_id"], :name => "index_funcionarios_on_departamento_id"

  create_table "historico_departamentos", :force => true do |t|
    t.integer  "mes"
    t.float    "orcamento_previsto"
    t.integer  "departamento_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "historico_departamentos", ["departamento_id"], :name => "index_historico_departamentos_on_departamento_id"

  create_table "historico_funcionarios", :force => true do |t|
    t.string   "cargo_antigo"
    t.string   "cargo_novo"
    t.float    "salario_antigo"
    t.float    "salario_novo"
    t.integer  "funcionario_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "historico_funcionarios", ["funcionario_id"], :name => "index_historico_funcionarios_on_funcionario_id"

  create_table "patrimonios", :force => true do |t|
    t.integer  "despesa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "patrimonios", ["despesa_id"], :name => "index_patrimonios_on_despesa_id"

  create_table "processos_seletivos", :force => true do |t|
    t.integer  "estagiario_id"
    t.integer  "vaga_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "processos_seletivos", ["estagiario_id"], :name => "index_processos_seletivos_on_estagiario_id"
  add_index "processos_seletivos", ["vaga_id"], :name => "index_processos_seletivos_on_vaga_id"

  create_table "receitas", :force => true do |t|
    t.float    "valor"
    t.integer  "cliente_id"
    t.integer  "calendario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "receitas", ["calendario_id"], :name => "index_receitas_on_calendario_id"
  add_index "receitas", ["cliente_id"], :name => "index_receitas_on_cliente_id"

  create_table "vagas", :force => true do |t|
    t.string   "cargo"
    t.float    "bolsa"
    t.integer  "cliente_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vagas", ["cliente_id"], :name => "index_vagas_on_cliente_id"

end
