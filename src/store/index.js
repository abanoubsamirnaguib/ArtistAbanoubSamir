import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    color: {
      color1: "#1e1e1e",
      color2: "#413D3D",
      color3: "#999999",
      color4: "#bbbbbb",
      color5: "#ffffff",
      SideBar:"#1e1e1e"
    },
    switch:false,
  },
  mutations: {
    color(state) {
      state.switch = true;
      return state.color = {
        color1: "#c90076",
        color2: "#D95B43",
        color3: "#C02942",
        color4: "#542437",
        color5: "#53777A",
        SideBar: 'linear-gradient(90deg, rgba(0,0,0,1) 0%, rgba(245,0,87,1) 81%, rgba(0,0,0,0.6651195503814875) 100%)'
        // "linear-gradient(90deg, rgba(201,0,118,1) 0%, rgba(253,29,29,1) 81%, rgba(0,0,0,0.6651195503814875) 100%)"
      }
    },
    dark(state) {
      state.switch = false;
      return state.color = {
        color1: "#1e1e1e",
        color2: "#413D3D",
        color3: "#999999",
        color4: "#bbbbbb",
        color5: "#ffffff",
        SideBar:"#1e1e1e"
      }
    }
  },
  actions: {
  },
  modules: {
  }
})
