const path = require('path');

module.exports = {
    context: __dirname,
    entry: "./frontend/widgets.jsx",
    output: {
        path: path.resolve(__dirname),
        filename: "bundle.js"
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/env', '@babel/react']
                    }
                },
            }
        ]
    },
    devtool: 'source-map',
    resolve: {
        extensions: [".js", ".jsx", "*"]
    }
};

//npm install @babel/core @babel/preset-env @babel/preset-react babel-loader react react-dom webpack  
// npm install -D webpack-cli