module.exports = {
  transpileDependencies: [
    'vuetify'
  ],
  // publicPath: process.env.NODE_ENV === "production" ? "http://localhost/music%20project/dist/" : "/",
  publicPath: process.env.NODE_ENV === "production" ? "/ArtistAbanoubSamir" : "/",

  chainWebpack: config => {
    config
        .plugin('html')
        .tap(args => {
            args[0].title = "Abanoub Samir Music Page";
            return args;
        })
}
}
