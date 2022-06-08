<template>
  <v-app id="inspire2">
    <v-container>
      <v-row style="height: 180px">
        <v-col>
          <h3
            class="white--text"
            style="font-family: 'Caveat', cursive; font-size: 20px"
          >
            Follow Me In
          </h3>
          <ButtonsSocial />
        </v-col>
      </v-row>

      <v-row
        style="background-color: #1e1e1e; margin: 15px; border-radius: 15px"
      >
        <v-col cols="0" :lg="6" :sm="12" :md="6" class="order-sm-last">
          <!-- #385F70 -->
          <v-card
            class="pa-3"
            :color="switch1 ? color.color3 : color.color1"
            dark
            height="fit-content"
          >
            <v-card-title class="text-h5 left-title">
              Abanoub Samir</v-card-title
            >

            <v-card-subtitle class="left-SubTitle"
              >Photo From Some parties.</v-card-subtitle
            >
            <v-container class="image-container pa-0">
              <v-img
                class="m-0 p-0 image"
                src="../assets/img/AboutMe2.jpg"
                aspect-ratio="1.15"
                contain
              ></v-img>
            </v-container>
          </v-card>
        </v-col>

        <v-col cols="0" :sm="12" :lg="6" :md="6">
          <!-- #385F70 -->
          <v-card
            class="pa-3"
            :color="switch1 ? color.color3 : color.color1"
            dark
            height="100%"
          >
            <br />
            <v-card-title class="Biography">Biography</v-card-title>
            <vue-typed-js
              v-if="show1"
              class="text-left"
              :strings="[
                ' A highly versatile artist, Abanoub is an Egyption Musician who got his start career in the 2011. ',
              ]"
              :loop="loop1"
              @onComplete="doSmth1()"
              :typeSpeed="10"
              :startDelay="1000"
              :showCursor="false"
              :fadeOut="true"
            >
              <strong><span class="typing"></span></strong>
            </vue-typed-js>
            <br />
            <vue-typed-js
              v-if="show2"
              class="text-left"
              :strings="[
                'Born on July 31, 1992, in El Fayoum, Egypt, Abanoub rose to stardom when recording Guitar sessions for A lot of Bands Music in the 2000s, hitting No. 1 with his Imagination in Music And Make Melody For songs for Different Singer . Abanoub has produced songs for many singers from all over the world, and has been welcomed to work as a music producer for many singers in many countries.  For his attractive, creative and sensitive imagination, as we have always been accustomed to from him, he deserves the title of he is The imagination Space which musical notes swim within and the soul that feels your soul wherever you are.',
              ]"
              :loop="loop1"
              @onComplete="doSmth2()"
              :typeSpeed="1"
              :startDelay="1000"
              :showCursor="true"
              :fadeOut="false"
            >
              <p><span class="typing"></span></p>
            </vue-typed-js>

            <v-row>
              <v-col cols="8">
                <v-card-title class="text-h5 left-title">
                  <vue-typed-js
                    class="lower"
                    v-if="show3"
                    :strings="['Abanoub Samir']"
                    :loop="loop1"
                    @onComplete="doSmth3()"
                    :typeSpeed="100"
                    :startDelay="1000"
                    :showCursor="false"
                    :fadeOut="true"
                  >
                    <p><span class="typing"></span></p>
                  </vue-typed-js>
                </v-card-title>
                <v-card-subtitle class="left-SubTitle pl-5">
                  <vue-typed-js
                    class="justify-center"
                    v-if="show4"
                    :strings="[' Music PRODUCER']"
                    :loop="loop1"
                    @onComplete="doSmth4()"
                    :typeSpeed="100"
                    :startDelay="1000"
                    :showCursor="false"
                    :fadeOut="true"
                  >
                    <p><span class="typing"></span></p>
                  </vue-typed-js>
                </v-card-subtitle>
              </v-col>
              <v-col cols="4">
                <v-card-subtitle class="sign">
                  <vue-typed-js
                    class="justify-center"
                    v-if="show5"
                    :strings="[' Abanoub.']"
                    :loop="loop1"
                    :typeSpeed="100"
                    :startDelay="1000"
                    :showCursor="false"
                    :fadeOut="true"
                  >
                    <p><span class="typing"></span></p>
                  </vue-typed-js>
                </v-card-subtitle>
              </v-col>
            </v-row>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <Message />
  </v-app>
</template>

<script>

export default {
  name: "aboutme",
  data: () => ({
    show1: true,
    show2: false,
    show3: false,
    show4: false,
    show5: false,
    loop1: false,
    loop2: false,
    //dark mode
    switch1: false,

  }),
  methods: {
    doSmth1() {
      this.show2 = true;
      // this.loop2=true;
    },
    doSmth2() {
      this.show3 = true;
    },
    doSmth3() {
      this.show4 = true;
    },
    doSmth4() {
      this.show5 = true;
    },
    colorDark() {
      this.switch1 = this.$store.state.switch;
      if (this.switch1 == true) {
        this.$store.commit("color");
      }
      if (this.switch1 == false) {
        this.$store.commit("dark");
      }
    },
  },
  created() {
    this.colorDark();
  },
  components: {},
  computed: {
    color() {
      return this.$store.state.color;
    },
  },
  watch: {
    color() {
      this.switch1 = this.$store.state.switch;
    },
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?&family=Kaushan+Script&&family=Comforter+Brush&family=Caveat:wght@700&family=Lobster&family=Sassy+Frass&display=swap");
#inspire2 {
  min-height: 100%;
  background: url("../assets/img/m2.jpg") rgba(0, 0, 0, 0.5);
  background-size: cover;
  background-blend-mode: multiply;
  background-origin: bottom right;
  background-attachment: fixed;
  background-position: bottom center;
}
.left-title {
  font-size: 36px !important;
  font-family: "Comforter Brush", cursive !important;
}
.left-SubTitle {
  font-size: 16px;
  font-family: "Comforter Brush", cursive !important;
}
.image-container {
  border: 5px solid whitesmoke;
}
.image {
  position: relative;
  top: 40px;
  left: 30px;
}
.Biography {
  font-weight: 400;
  font-size: 2.5rem !important;
  font-family: "Lobster", cursive;
  line-height: 0.9;
  margin-bottom: 30px;
  position: relative;
  word-wrap: break-word;
  z-index: 1;
  width: fit-content;
  &:before {
    background-color: #dd4377;
    content: "";
    height: 2px;
    left: 0;
    position: absolute;
    right: 0;
    top: 50%;
    z-index: -1;
    box-sizing: border-box;
  }
}
.sign {
  font-size: 36px !important;
  font-family: "Sassy Frass", cursive;
}
@media screen and (max-width: 768px) {
  .image {
    position: relative;
    top: 0px;
    left: 0px;
  }
  .image-container {
    border: 1px solid transparent;
  }
  .Biography {
    font-size: 2rem !important;
  }
  .sign {
    font-size: 26px !important;
  }
  .lower {
    font-size: 32px !important;
  }
  .order-sm-last {
    order: -1;
  }
}
</style>