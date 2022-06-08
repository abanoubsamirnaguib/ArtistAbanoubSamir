import '@fortawesome/fontawesome-free/css/all.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

import Vue from 'vue';
import Vuetify from 'vuetify/lib/framework';
import Carousel3d from 'vue-carousel-3d';
import VueSocialSharing from 'vue-social-sharing'

Vue.use(VueSocialSharing, {
  networks: {
    instagram: 'https://www.instagram.com/share?url=@url&title=@title'
  }
});

Vue.use(Vuetify);
Vue.use(Carousel3d);

export default new Vuetify({
    icons: {
        iconfont: 'fa' || 'md'
    },
    theme: {
        themes: {
            dark: {
                background: '#2F3346'
            }
        }
    }
});
