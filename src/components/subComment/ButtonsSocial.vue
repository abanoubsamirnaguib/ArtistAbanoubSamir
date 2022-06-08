<template>
  <div>
    <v-container>
      <v-row>
        <v-col class="d-flex justify-center">
          <v-card-actions class="justify-center flex-wrap">
            <v-btn
              v-for="(social, i) in socials"
              :key="i"
              :color="social.color"
              class="white--text btn"
              fab
              icon
              link
              :href="social.route"
              target="_blank"
            >
              <v-icon>{{ social.icon }}</v-icon>
              <!-- <a ></a> -->
            </v-btn>
          </v-card-actions>
        </v-col>
      </v-row>
    </v-container>

    
  </div>
</template>

<script>
export default {
  name: "ButtonsSocial",
  components: {},
  data: () => ({
    socials: [
      {
        icon: "mdi-facebook",
        color: "indigo lighten-5",
        route: "https://www.facebook.com/abanoub.samir.501/",
      },
      {
        icon: "mdi-linkedin",
        color: "cyan darken-1",
        route: "https://www.linkedin.com/in/abanoub-naguib-68b723132/",
      },
      {
        icon: "mdi-instagram",
        color: "red lighten-3",
        route: "https://www.instagram.com/abanoubs_samir/",
      },
      {
        icon: "mdi-youtube",
        color: "red lighten-1",
        route: "https://www.youtube.com/user/MrAbanoubsamir",
      },
      {
        icon: "mdi-spotify",
        color: "green lighten-3",
        route: "https://spotify.com",
      },
      {
        icon: "mdi-soundcloud",
        color: "orange lighten-1",
        route: "https://soundcloud.com/abanoub-samir-820693676",
      },
    ],
    direction: "top",
    fab: false,
    fling: false,
    hover: false,
    tabs: null,
    top: false,
    right: true,
    bottom: true,
    left: false,
    transition: "slide-y-reverse-transition",
  }),

  methods: {},
  watch: {
    top(val) {
      this.bottom = !val;
    },
    right(val) {
      this.left = !val;
    },
    bottom(val) {
      this.top = !val;
    },
    left(val) {
      this.right = !val;
    },
  },
};
</script>

<style lang="scss" scoped>
.v-btn {
  opacity: 0.8;
  &:hover {
    opacity: 1;
  }
}
.v-card__actions {
  background-color: rgba($color: #63636384, $alpha: 0.5);
  border-radius: 35px;
  background-size: cover;
  padding: 0px !important;
  max-width: fit-content;
}
@media screen and (max-width: 768px) {
  .v-btn {
    height: 36px !important;
    width: 36px !important;
    // background-color: rgba($color: #030000c7, $alpha: .50);
  }
  .v-card__actions {
    background-color: rgba($color: #63636384, $alpha: 0.5);
    border-radius: 15px;
  }
}
</style>
