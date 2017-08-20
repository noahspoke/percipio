const path = require('path');
const ExtractText = require('extract-text-webpack-plugin');


module.exports = {
	entry: './app/assets/javascripts/application.js',
	output: {
		filename: 'bundle.js',
		path: path.resolve(__dirname, 'public')
	},

	module: {
		loaders: [
			{
				test: /\.scss$/,
				use: ExtractText.extract({
					fallback: 'style-loader',
					use: ['css-loader', 'sass-loader'],
				})
			}
		]
	},

	plugins: [
		new ExtractText('build.css'),
	]
};