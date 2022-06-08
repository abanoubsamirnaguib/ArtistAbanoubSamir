// sitemap
const SitemapPlugin = require('sitemap-webpack-plugin').default;
const paths = [
  {
    path: '/ArtistAbanoubSamir/',
    lastmod: new Date().toISOString().slice(0, 10),
    priority: 0.8,
    changefreq: 'hourly'
  },
  {
    path: '/ArtistAbanoubSamir/AboutMe/',
    lastmod: new Date().toISOString().slice(0, 10),
    priority: 0.8,
    changefreq: 'hourly'
  },
  {
    path: '/ArtistAbanoubSamir/Home/',
    lastmod: new Date().toISOString().slice(0, 10),
    priority: 0.8,
    changefreq: 'hourly'
  },
];

module.exports = {
  transpileDependencies: [
    'vuetify'
  ],
  // devServer: {
  //   https: true
  // },
  
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
      new SitemapPlugin({
        base: 'https://abanoubsamirnaguib.github.io/ArtistAbanoubSamir', paths, options: {
          filename: 'sitemap.xml',
          lastmod: true,
          changefreq: 'hourly',
          priority: 0.8,
        }
      })
    ]
  }

}


