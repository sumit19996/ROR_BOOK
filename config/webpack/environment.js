const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.append('Provide',new webpack.ProvidePligin({ 
	$: 'jquery'
	jQuery: 'jQuery'
	Popper: ['popper.js','default']
})
)
module.exports = environment
