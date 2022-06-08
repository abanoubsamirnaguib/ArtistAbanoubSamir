import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import VueRouter from 'vue-router'
import VueTypedJs from 'vue-typed-js'

import shareit from './plugins/shareit.js';
// import {mix} from './assets/typeit.js';

//shared component
import ButtonsSocial from "./components/subComment/ButtonsSocial.vue";
import Message from "./components/subComment/message.vue";


Vue.config.productionTip = false

Vue.use(VueRouter);
Vue.use(VueTypedJs);
Vue.use(shareit);
// Vue.mixin(mix);
Vue.component("Message",Message);
Vue.component("ButtonsSocial",ButtonsSocial);

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
