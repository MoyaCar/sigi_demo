# Helpers usados en el layout o en muchas páginas.
module ApplicationHelper
  def nombre_de_app
    Rails.application.class.module_parent_name.upcase
  end

  # Cada página que requiera un título debe proveerlo específicamente.
  def titulo_de_pagina
    content_for :titulo_de_pagina
  end

  # Orden invertido (página, app) para mejor lectura en los tabs.
  def titulo_de_app
    [titulo_de_pagina, nombre_de_app].reject(&:nil?).join(' | ')
  end

  def clase_bootstrap_para(tipo_de_flash)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-danger',
      notice: 'alert-success'
    }.stringify_keys[tipo_de_flash.to_s] || tipo_de_flash.to_s
  end

  # FIXME: Es tan general que corre el riesgo de pasar flash sin formato.
  def notificaciones(opts = {})
    flash.each do |tipo_de_mensaje, mensaje|
      concat(content_tag(:div, mensaje, class: "alert #{clase_bootstrap_para(tipo_de_mensaje)}", role: "alert") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat mensaje
      end)
    end
    nil
  end
end
