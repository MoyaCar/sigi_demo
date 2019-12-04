# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_07_223617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actas", force: :cascade do |t|
    t.string "numero", default: "", null: false
    t.datetime "fecha_y_hora"
    t.string "estado", default: "inicial", null: false
    t.bigint "expediente_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lugar"
    t.string "tipo_de_unidad"
    t.string "tipo_de_servicio"
    t.string "dominio"
    t.string "titular"
    t.string "grupo"
    t.string "documento"
    t.string "domicilio"
    t.boolean "unidad_retenida", default: false, null: false
    t.boolean "lista_de_pasajeros", default: false, null: false
    t.datetime "fecha_de_asociacion"
    t.bigint "tipo_de_infraccion_id"
    t.index ["expediente_id"], name: "index_actas_on_expediente_id"
    t.index ["numero"], name: "index_actas_on_numero", unique: true
    t.index ["tipo_de_infraccion_id"], name: "index_actas_on_tipo_de_infraccion_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "adjuntos", force: :cascade do |t|
    t.string "adjuntable_type"
    t.bigint "adjuntable_id"
    t.string "referencia", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adjuntable_type", "adjuntable_id"], name: "index_adjuntos_on_adjuntable_type_and_adjuntable_id"
  end

  create_table "descargos", force: :cascade do |t|
    t.bigint "acta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["acta_id"], name: "index_descargos_on_acta_id"
    t.index ["user_id"], name: "index_descargos_on_user_id"
  end

  create_table "dictamenes", force: :cascade do |t|
    t.string "identificador"
    t.bigint "expediente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expediente_id"], name: "index_dictamenes_on_expediente_id"
  end

  create_table "expedientes", force: :cascade do |t|
    t.string "identificador", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tipo_de_documento"
    t.string "referencia"
    t.index ["identificador"], name: "index_expedientes_on_identificador", unique: true
  end

  create_table "resoluciones", force: :cascade do |t|
    t.integer "multa"
    t.bigint "dictamen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dictamen_id"], name: "index_resoluciones_on_dictamen_id"
  end

  create_table "tipos_de_infraccion", force: :cascade do |t|
    t.string "identificador"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actas", "expedientes"
  add_foreign_key "actas", "tipos_de_infraccion"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "descargos", "actas"
  add_foreign_key "descargos", "users"
  add_foreign_key "dictamenes", "expedientes"
  add_foreign_key "resoluciones", "dictamenes"
end
