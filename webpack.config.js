var ExtractTextPlugin = require("extract-text-webpack-plugin");
var CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
	entry: ["./web/static/css/app.css", "./web/static/js/app.js"],

	output: {
		path: "./priv/static",
		filename: "js/app.js"
	},

	resolve: {
		modulesDirectories: [ "node_modules", __dirname + "/web/static/js" ]
	},

	module: {
		loaders: [
			{
				test: /\.jsx?$/,
				exclude: /node_modules/,
				loader: "babel-loader",
				include: __dirname,
				query: {
					presets: ["es2015", "react"]
				}
			}, {
				test: /\.css$/,
				loader: ExtractTextPlugin.extract("style", "css")
			}, {
				test: /\.scss$/,
				loader: ExtractTextPlugin.extract(
					"style",
					"css!sass?includePaths[]=" + __dirname +  "/node_modules"
				)
			}
		]
	},

	plugins: [
		new ExtractTextPlugin("css/app.css"),
		new CopyWebpackPlugin([{ from: "./web/static/assets" }])
	]
};
