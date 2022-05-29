import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Music from '../components/Music.vue'
import AboutMe from '../components/aboutMe.vue'
import ContactMe from '../components/ContactMe.vue'
import news from '../components/news.vue'
import testimonials from '../components/testimonials.vue'
import photos from '../components/photos.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home ,
    alias:"/Home",
    meta: {
      title: 'Music || Home'
    }
  },
  {
    path: '/MyWorks',
    name: 'my-work',
    component: Music ,
    meta: {
      title: 'Music || Music Track'
    }
  },
  {
    path: '/AboutMe',
    name: 'aboutme',
    component: AboutMe ,
    meta: {
      title: 'Music || About Me'
    }
  },
  {
    path: '/ContactMe',
    name: 'ContactMe',
    component: ContactMe ,
    meta: {
      title: 'Music || Contact Me'
    }
  },
  {
    path: '/photos',
    name: 'photos',
    component: photos ,
    // component: () => import(/* webpackChunkName: "about" */ '../components/photos.vue'),
        meta: {
      title: 'Music || Photos'
    }
  
  },
  {
    path: '/Videos',
    name: 'Videos',
    component: () => import(/* webpackChunkName: "about" */ '../components/videos.vue'),
        meta: {
      title: 'Music || Videos'
    }
  },
  {
    path: '/News',
    name: 'News',
    component: news,
    meta: {
      title: 'Music || News'
    }
  },
  {
    path: '/testimonials',
    name: 'testimonials',
    component:testimonials,
        meta: {
      title: 'Music || Testimonials'
    }
  },
  {
    path: '**',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue'),
        meta: {
      title: 'Music ||  Not Found Page'
    }
  },


  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue'),
  //       meta: {
  //     title: 'Music || About Me'
  //   }
  // },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
