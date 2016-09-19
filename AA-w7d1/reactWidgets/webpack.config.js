module.exports = {
  entry: "./widgets.jsx",
  output: {
    filename: "./bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.js?$/, /\.jsx?$/],
        exclude: /node_modules/,
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ["", ".js", ".jsx"]
  }
};
