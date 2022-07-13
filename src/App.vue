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
    this.$store.dispatch("PhotosModule/loadPhotos");
    this.$store.dispatch("VideosModule/loadVideos");
    this.$store.dispatch("testimonialsModule/loadTestimonials");
    this.$store.dispatch("MusicModule/loadMusic");
    this.$store.dispatch("NewsModule/loadNews");
  },
  mounted() {
    
  },
  watch: {
    $route(to) {
      document.title = to.meta.title || "Music";
    },
    
    // Apis
    // videos(data) {
    //   console.log(data);
    // },
    // Photos(data) {
    //   console.log(data);
    // },
    // Testimonials(data) {
    //   console.log(data);
    // },
    // News(data) {
    //   console.log(data);
    // },
    // Music(data) {
    //   console.log(data);
    // },
  },
  computed: {
    videos() {
      let response = this.$store.state.VideosModule.apivideos;
      return response;
    },
    Photos() {
      let response = this.$store.state.PhotosModule.apiPhotos;
      return response;
    },
    Testimonials() {
      let response = this.$store.state.testimonialsModule.testimonials;
      return response;
    },
    News() {
      let response = this.$store.state.NewsModule.News;
      return response;
    },
    Music() {
      let response = this.$store.state.MusicModule.Tracks;
      return response;
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
