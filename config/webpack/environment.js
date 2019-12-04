const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// Loader que resuelve los paths relativos, como por ejemplo los de las fuentes
// de fontawesome. Tiene que estar antes del loader de sass.
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

// Cargamos algunas librerías globalmente con los identificadores necesarios.
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
