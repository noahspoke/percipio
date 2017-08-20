var debug = process.env.NODE_ENV !== "production";

const webpack = require('webpack');
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
				test: /\.js$/,
				exclude: /(node_modules)/,
				loader: 'babel-loader',
				query: {
					presets: ['react', 'es2015', 'stage-0'],
					plugins: ['react-html-attrs', 'transform-class-properties', 'transform-decorators-legacy']
				}
			},

			{
				test: /\.scss$/,
				use: ExtractText.extract({
					fallback: 'style-loader',
					use: ['css-loader', 'sass-loader']
				})
			}
		]
	},

	plugins: [
		new ExtractText('build.css')
	]
};