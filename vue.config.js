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
},


// sitemap
configureWebpack: {
  plugins: [
      new SitemapPlugin('https://abanoubsamirnaguib.github.io/ArtistAbanoubSamir/', paths, {
          filename: 'sitemap.xml',
          lastmod: true,
          changefreq: 'hourly',
          priority: '0.8'
      })
  ]
}

}


// sitemap
const SitemapPlugin = require('sitemap-webpack-plugin').default;
const paths = [
    {
        path: '/',
        lastmod: new Date().toISOString().slice(0,10),
        priority: '0.8',
        changefreq: 'hourly'
    },
];