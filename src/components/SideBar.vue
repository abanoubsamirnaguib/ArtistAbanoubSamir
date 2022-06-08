<template>
  <v-sheet>
    <v-navigation-drawer
      class="navigation"
      app
      :style="{background: color.SideBar  }"
      color="#1e1e1e"
      dark
      v-model="drawer"
      :mini-variant.sync="mini"
      :expand-on-hover="$vuetify.breakpoint.lgOnly"
      :temporary="$vuetify.breakpoint.smOnly"
    >
      <div class="text-center mt-5">
        <!-- <v-icon x-large color="orange darken-2">fab fa-soundcloud</v-icon>  -->
        <v-img
          class="d-block ma-auto swing"
          src="../assets/img/logo5.png"
          max-width="40"
        ></v-img>
        <v-btn class="mt-3 text-capitalize" text color="" outlined v-if="!mini">
          Abanoub Samir <br />
          Artist Page
          <v-btn icon @click.stop="mini = !mini">
            <v-icon>mdi-chevron-left</v-icon>
          </v-btn>
        </v-btn>
        <v-divider></v-divider>
      </div>

      <v-switch
        v-if="!mini"
        class="ml-10 text--black"
        v-model="switch1"
        inset
        @change="colorDark()"
        color="white darken-0"
        :label="`${switch1 ? 'Color' : 'Dark'} `"
      ></v-switch>

      <h4 class="mt-6 ml-5 white--text text-left" v-if="!mini">Introduction</h4>
      <v-list flat dense class="mt-0 text-left">
        <v-list-item-group v-model="selectedItem" color="orange">
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            active-class="border"
            link
            :to="item.route"
          >
            <v-list-item-icon>
              <v-icon v-text="item.icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title v-text="item.text"></v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
      <v-divider class="mx-10"></v-divider>
      <h4 class="mt-3 ml-5 white--text text-left" v-if="!mini">Collection</h4>
      <v-list flat dense class="mb-5 text-left">
        <v-list-item-group v-model="selectedItem2" color="orange">
          <v-list-item
            v-for="(item, i) in collections"
            :key="i"
            active-class="border"
            link
            :to="item.route"
          >
            <v-list-item-icon>
              <v-icon v-text="item.icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title v-text="item.text"></v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

    <v-btn
      class="tabIcon d-lg-none d-xl-flex"
      dark
      @click.stop="
        () => {
          mini = false;
          drawer = !drawer;
        }
      "
    >
      <!-- <v-icon>mdi-view-dashboard</v-icon> -->
      <v-icon >mdi mdi-format-list-bulleted</v-icon>
    </v-btn>
  </v-sheet>
</template>
<script>
// import SideBar from "./components/SideBar.vue";

export default {
  data: () => ({
    selectedItem: 0,
    selectedItem2: 0,
    drawer: null,
    mini: false,
    // temporary,
    items:[
      { icon: "fas fa-satellite-dish", text: "Home", route: "/Home" },
      { icon: "fas fa-stream", text: "About ME", route: "/AboutMe" },
      { icon: "fas fa-user", text: "Contact Me", route: "/ContactMe" },
      { icon: "fas fa-chart-pie", text: "My Music Tracks", route: "/MyWorks/0" },
    ],
    collections: [
      { icon: "fas fa-image", text: "photos", route: "/photos" },
      { icon: "fab fa-youtube", text: "Videos", route: "/Videos" },
      // {icon: 'fas fa-compact-disc', text: 'Albums', route: '/albums'},
      { icon: "fas fa-podcast", text: "News", route: "/News" },
      { icon: "fas fa-users", text: "testimonials", route: "/testimonials" },
    ],
    //dark mode
    switch1: false,
  }),

  mounted() {
    // console.log(this.$vuetify.breakpoint.name)
    if (this.$vuetify.breakpoint.mobile) {
      this.mini = true;
    }
    document.body.style.zoom = "100%";
  },
  methods: {
    dr() {
      this.mini = false;
      this.drawer = !this.drawer;
      console.log(this.mini);
    },
    colorDark() {
      if (this.switch1 == true) {
        this.$store.commit("color");
      }
      if (this.switch1 == false) {
        this.$store.commit("dark");
      }
    },
  },
  computed: {
    color() {
      return this.$store.state.color;
    },
    
  },
};
</script>
<style scoped>
/*div >>> .v-list a {
    text-decoration: none;
}*/
.border {
  border-right: 4px solid orange;
}
.tabIcon {
  position: absolute;
  top: 10px;
  left: 5px;
  z-index: 1;
  border: 1px solid white;
  min-width: 40px !important;
  min-height: 60px;
  border-radius: 100%;
}
/* animation */
.swing {
  -webkit-transform-origin: top center;
  -ms-transform-origin: top center;
  transform-origin: top center;
  -webkit-animation-name: swing;
  animation-name: swing;
  -webkit-animation-duration: 1s;
  animation-duration: 5s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  animation-iteration-count: infinite;
}
@-webkit-keyframes swing {
  20% {
    -webkit-transform: rotate3d(0, 0, 1, 15deg);
    transform: rotate3d(0, 0, 1, 15deg);
  }
  40% {
    -webkit-transform: rotate3d(0, 0, 1, -10deg);
    transform: rotate3d(0, 0, 1, -10deg);
  }
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 5deg);
    transform: rotate3d(0, 0, 1, 5deg);
  }
  80% {
    -webkit-transform: rotate3d(0, 0, 1, -5deg);
    transform: rotate3d(0, 0, 1, -5deg);
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 0deg);
    transform: rotate3d(0, 0, 1, 0deg);
  }
}
@keyframes swing {
  20% {
    -webkit-transform: rotate3d(0, 0, 1, 15deg);
    transform: rotate3d(0, 0, 1, 15deg);
  }
  40% {
    -webkit-transform: rotate3d(0, 0, 1, -10deg);
    transform: rotate3d(0, 0, 1, -10deg);
  }
  60% {
    -webkit-transform: rotate3d(0, 0, 1, 5deg);
    transform: rotate3d(0, 0, 1, 5deg);
  }
  80% {
    -webkit-transform: rotate3d(0, 0, 1, -5deg);
    transform: rotate3d(0, 0, 1, -5deg);
  }
  100% {
    -webkit-transform: rotate3d(0, 0, 1, 0deg);
    transform: rotate3d(0, 0, 1, 0deg);
  }
}
</style>
<style lang='scss' >
/* // scrollbar */
/* width */
.navigation {
  ::-webkit-scrollbar {
    height: 15px;
    width: 5px;
  }

  /* Track */
  ::-webkit-scrollbar-track {
    background: #f1f1f1;
  }

  /* Handle */
  ::-webkit-scrollbar-thumb {
    background: #888;
  }

  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
    background: #555;
  }
}
</style>