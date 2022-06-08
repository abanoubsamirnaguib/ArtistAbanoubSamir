<template>
  <div id="app">
    <v-app
      id="inspire"
      :style="{ background: $vuetify.theme.themes.dark.background }"
    >
      <SideBar />
      <v-slide-x-transition name="slide" mode="in-out" :hide-on-leave="true">
        <v-main>
          <router-view></router-view>
        </v-main>
      </v-slide-x-transition>
    </v-app>
  </div>
</template>

<script>
import SideBar from "./components/SideBar.vue";

export default {
  name: "App",
  data: () => ({}),

  components: {
    SideBar,
  },
  created() {
    // console.log(this.$router.currentRoute.path);
    // console.log(this.$vuetify);
    
    // Call Apis
    console.log(this.$store.state.switch);
  },
  watch: {
    $route(to) {
      document.title = to.meta.title || "Music";
    },
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
