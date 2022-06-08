<template>
  <v-app id="inspire2">
    <v-container class="">
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

      <v-row v-if="items.length > 1">
        <v-col cols="12">
          <div class="sign">
            <v-card-title
              class="text-h4 bg-dark text-light mx-auto title"
              style="word-break: keep-all; line-height: 3rem"
            >
              <span class="fast-flicker"> Don't Take Our </span>
              <span class="blue-flicker">&nbsp; Word &nbsp;</span>
              <span class="flicker"> for it </span> ,
              <span class="green-flicker">&nbsp; take theirs</span>
              <!-- Don't Take Our Word for it ,take theirs -->
            </v-card-title>
          </div>
          <v-carousel
            :hide-delimiter-background="true"
            cycle
            interval="2999900"
            show-arrows-on-hover
            hide-delimiters
            @change="slideChange($event)"
            :value="select"
            dark
          >
            <v-carousel-item
              v-for="(item, i) in items"
              :key="i"
              max-width="700"
              class="mx-auto"
              max-height="350"
            >
              <v-sheet width="auto" max-height="300" tile>
                <v-card
                  min-height="300"
                  min-width="600"
                  class="overflow-hidden card"
                  :light="switch1"
                  :dark="!switch1"
                >
                  <v-container>
                    <v-row style="height: 300px; width: 600px" class="cardRow">
                      <!-- <div class="d-flex flex-no-wrap justify-space-between" style="height:100%;"> -->
                      <v-col cols="6" style="padding: 0px; height: 300px">
                        <v-img :src="item.src" aspect-ratio="1" class="image">
                        </v-img>
                        <div class="circle"  :style="{ backgroundColor: switch1 ? 'white' : color.color1 }" ></div>
                      </v-col>
                      <v-col cols="6" light style="padding: 5px; height: 300px; ">
                        <!-- <div> -->
                        <v-row>
                          <v-col cols="12" style="max-height: 15vh">
                            <v-card-title
                              class="text-h5 font-weight-black "
                              style="word-break: keep-all ; text-transform: capitalize;"
                              v-text="item.name"
                            ></v-card-title>
                            <v-card-subtitle
                              class="font-italic text-capitalize"
                              v-text="item.job"
                            ></v-card-subtitle>
                          </v-col>
                        </v-row>
                        <v-row
                          style="
                            padding:0px 10px;
                            overflow-x: hidden;
                            width: fit-content;
                          "
                          class="descriptionRow"
                        >
                          <v-card-text
                            class="description text-h6 text-left px-lg-0 pa-1"
                            v-html="item.description"
                          >
                          </v-card-text>
                        </v-row>
                        <v-row>
                          <v-card-actions>
                            <v-list-item class="grow">
                              <v-row align="center" class="flex-nowrap">
                                <v-btn
                                  color="transparent"
                                  @click="likes(i, $event)"
                                  depressed
                                >
                                  <v-icon
                                    class="mr-1 heart"
                                    :color="item.likes.bol ? '#c80303' : ''"
                                    >mdi-heart
                                  </v-icon>
                                  <span class="subheading mr-5">
                                    {{ item.likes.number }}
                                  </span>
                                </v-btn>
                              </v-row>
                            </v-list-item>
                          </v-card-actions>
                        </v-row>
                        <!-- </div> -->
                      </v-col>
                      <!-- </div> -->
                    </v-row>
                  </v-container>
                </v-card>
              </v-sheet>
            </v-carousel-item>
          </v-carousel>
        </v-col>
      </v-row>
      <v-row style="width: 100%; overflow: overlay" v-if="items.length > 1">
        <v-col cols="12" class="d-flex overflow-scroll justify-lg-center">
          <div
            :class="select == i ? 'selected' : 'bg-dark'"
            class="ma-5"
            style="height: 100px; width: 100px"
            v-for="(item, i) in items"
            :key="i"
            :select="select"
          >
            <v-img
              @click="slideChange(i)"
              class="ma-0 rounded-lg"
              :src="item.src"
            ></v-img>
          </div>
        </v-col>
      </v-row>

                <v-progress-circular
            v-if="(items.length == 1)"
            :size="200"
            :width="10"
            color="red "
            class="mt-4"
            indeterminate
          ></v-progress-circular>
    </v-container>
    <Message />
  </v-app>
</template>

<script>


export default {
  name: "News",
  data: () => ({
    select: 0,
    items: [{}
      // {
      //   color: "#1F7087",
      //   src: "https://cdn.vuetifyjs.com/images/cards/foster.jpg",
      //   name: "Supermodel",
      //   job: "Foster the People",
      //   description:
      //     "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
      //   likes: { bol: false, number: 256 },
      //   share: { link: "https://www.facebook.com/", number: 35, bol: false },
      //   category: "Life",
      // },
      // {
      //   color: "#1F7087",
      //   src: "https://cdn.vuetifyjs.com/images/cards/foster.jpg",
      //   name: "Supermodel",
      //   job: "Foster the People",
      //   description:
      //     "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
      //   likes: { bol: false, number: 256 },
      //   share: { link: "https://www.facebook.com/", number: 35, bol: false },
      //   category: "Life",
      // },
      // {
      //   color: "#1F7087",
      //   src: "https://cdn.vuetifyjs.com/images/cards/foster.jpg",
      //   name: "Supermodel",
      //   job: "Foster the People",
      //   description:
      //     "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
      //   likes: { bol: false, number: 256 },
      //   share: { link: "https://www.facebook.com/", number: 35, bol: false },
      //   category: "Life",
      // },
      // {
      //   color: "#952175",
      //   src: "https://cdn.vuetifyjs.com/images/cards/halcyon.png",
      //   name: "Halcyon Days",
      //   job: "Ellie Goulding",
      //   description:
      //     "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
      //   likes: { bol: false, number: 250 },
      //   share: { link: "https://www.facebook.com/", number: 45, bol: false },
      //   category: "Music",
      // },

    ],
    switch1: false,
  }),
  components: {},
  created() {
    const axios = require("axios");
    var base_url =
      // "http://192.168.1.10/music%20project/music%20project/public/api/testimonials";
      "http://asmusicbackend-07251.herokuapp.com/public/api/testimonials";
    axios
      .get(base_url)
      .then((response) => {
        var Data = response.data.data;
        this.items = Data;
        console.log(this.items);

        // get likes from localStorage
        for (let n = 0; n < this.items.length; n++) {
          if (localStorage.getItem(`testimonialsLikesOf${n}`) !== null) {
            this.items[n].likes.bol = JSON.parse(
              localStorage.getItem(`testimonialsLikesOf${n}`)
            ).bol;
          }
        }
      })
      .catch((error) => {
        console.log(error);
        this.errored = true;
      });

    this.colorDark();
  },
  methods: {
    slideChange(e) {
      this.select = e;
    },
    likes(i) {
      this.items[i].likes.bol = !this.items[i].likes.bol;
      if (this.items[i].likes.bol == true) {
        this.items[i].likes.number++;
        // ADD TO BACKEND
        const axios = require("axios");
        let base_url =
        //  `http://192.168.1.10/music%20project/music%20project/public/api/testimonials/addLike/${this.items[i].id}`;
         `http://asmusicbackend-07251.herokuapp.com/public/api/testimonials/addLike/${this.items[i].id}`;
        axios
          .get(base_url)
          // .then((response) => {
          //   var Data1 = response.data.data;
          //   // this.items[i] = Data1;
          //   console.log(Data1);
          // })
          .catch((error) => {
            console.log(error);
            this.errored = true;
          });
      } else {
        this.items[i].likes.number--;
        // ADD TO BACKEND
        const axios = require("axios");
        let base_url = 
        // `http://192.168.1.10/music%20project/music%20project/public/api/testimonials/subLike/${this.items[i].id}`;
        `http://asmusicbackend-07251.herokuapp.com/public/api/testimonials/subLike/${this.items[i].id}`;
        axios
          .get(base_url)
          // .then((response) => {
          //   var Data2 = response.data.data;
          //   this.items[i] = Data2;
          //   console.log(Data2);
          // })
          .catch((error) => {
            console.log(error);
            this.errored = true;
          });
      }
      localStorage.setItem(
        `testimonialsLikesOf${i}`,
        JSON.stringify(this.items[i].likes)
      );
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
  background: url("../assets/img/m1.jpg") rgba(0, 0, 0, 0.2);
  background-size: cover;
  background-blend-mode: multiply;
  background-origin: bottom right;
  background-attachment: fixed;
  background-position: bottom center;
}
.v-carousel {
  height: 300px !important;
}
.image {
  width: 100%;
  height: 100%;
  border-radius: 0px 0px 1000px 0px;
}
.circle {
  width: 400px;
  height: 100px;
  background-color: white;
  border-radius: 50%;
  position: absolute;
  bottom: -50px;
  left: -10px;
  transform: rotate(-5deg);
  clip-path: polygon(0 0, 50% 0, 50% 100%, 0 100%);
}
.title {
  font-weight: bolder;
  font-style: italic;
  margin-bottom: 25px;
  // font-family: "Caveat", cursive !important;
  font-family: "Kaushan Script", cursive !important;
}
.selected {
  border: 4px solid #ffebee;
  transform: scale(1.25);
  border-radius: 10px;
}
.bottomImage {
  height: 100px;
  width: 100px;
}
.v-btn:hover .heart {
  color: rgb(200, 3, 3);
}
.card {
  height: 300px;
  width: 500px;
}
.descriptionRow {
  height: 20vh;
}
@media screen and (max-width: 768px) {
  .v-carousel {
    height: 85% !important;
  }
  .circle {
    clip-path: polygon(0 0, 50% 0, 50% 100%, 0 100%);
  }
  .cardRow {
    width: 90vw !important;
  }
  .description {
    font-size: 15px !important;
    min-height: 10vh;
  }
  .descriptionRow {
    height: 13vh;
  }

  // scrollbar
  ::-webkit-scrollbar {
    height: 5px !important;
  }
}

// scrollbar
/* width */
::-webkit-scrollbar {
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
//title
.flicker {
  animation: shine 2s forwards, blink 5s 2s infinite;
}

.fast-flicker {
  animation: shine 2s forwards, blink 5s 2s infinite;
}
.blue-flicker {
  animation: blue 4s forwards, blink-blue 6s 1s infinite;
}
.green-flicker {
  animation: green 4s forwards, blink-green 6s 1s infinite;
}

@keyframes blink {
  0%,
  22%,
  36%,
  75% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #ff65bd,
      -0.2rem 0.1rem 1rem #ff65bd, 0.2rem 0.1rem 1rem #ff65bd,
      0 -0.5rem 2rem #ff2483, 0 0.5rem 3rem #ff2483;
  }
  28%,
  33% {
    color: #ff65bd;
    text-shadow: none;
  }
  82%,
  97% {
    color: #ff2483;
    text-shadow: none;
  }
}
@keyframes shine {
  0% {
    color: #6b1839;
    text-shadow: none;
  }
  100% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #ff65bd,
      -0.2rem 0.1rem 1rem #ff65bd, 0.2rem 0.1rem 1rem #ff65bd,
      0 -0.5rem 2rem #ff2483, 0 0.5rem 3rem #ff2483;
  }
}
@keyframes blink-green {
  0%,
  22%,
  36%,
  75% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #49ff18,
      -0.2rem 0.1rem 1rem #0fa, 0.2rem 0.1rem 1rem #0fa,
      0 -0.5rem 2rem rgb(68, 255, 193), 0 0.5rem 3rem rgb(137, 250, 212);
  }
  28%,
  33% {
    color: #0fa;
    text-shadow: none;
  }
  82%,
  97% {
    color: rgb(0, 214, 143);
    text-shadow: none;
  }
}
@keyframes green {
  0% {
    color: #6b1839;
    text-shadow: none;
  }
  100% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #0fa, -0.2rem 0.1rem 1rem #0fa,
      0.2rem 0.1rem 1rem #0fa, 0 -0.5rem 2rem rgb(68, 255, 193),
      0 0.5rem 3rem rgb(137, 250, 212);
  }
}
@keyframes blink-blue {
  0%,
  22%,
  36%,
  75% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #5271ff,
      -0.2rem 0.1rem 1rem #5271ff, 0.2rem 0.1rem 1rem #5271ff,
      0 -0.5rem 2rem #8198ff, 0 0.5rem 3rem #5271ff;
  }
  28%,
  33% {
    color: #5271ff;
    text-shadow: none;
  }
  82%,
  97% {
    color: #5271ff;
    text-shadow: none;
  }
}
@keyframes blue {
  0% {
    color: #5271ff;
    text-shadow: none;
  }
  100% {
    color: #ffe6ff;
    text-shadow: 0 0 0.6rem #ffe6ff, 0 0 1.5rem #5271ff,
      -0.2rem 0.1rem 1rem #5271ff, 0.2rem 0.1rem 1rem #5271ff,
      0 -0.5rem 2rem #8198ff, 0 0.5rem 3rem #8198ff;
  }
}

@keyframes flicker {
  from {
    opacity: 1;
  }

  4% {
    opacity: 0.9;
  }

  6% {
    opacity: 0.85;
  }

  8% {
    opacity: 0.95;
  }

  10% {
    opacity: 0.9;
  }

  11% {
    opacity: 0.922;
  }

  12% {
    opacity: 0.9;
  }

  14% {
    opacity: 0.95;
  }

  16% {
    opacity: 0.98;
  }

  17% {
    opacity: 0.9;
  }

  19% {
    opacity: 0.93;
  }

  20% {
    opacity: 0.99;
  }

  24% {
    opacity: 1;
  }

  26% {
    opacity: 0.94;
  }

  28% {
    opacity: 0.98;
  }

  37% {
    opacity: 0.93;
  }

  38% {
    opacity: 0.5;
  }

  39% {
    opacity: 0.96;
  }

  42% {
    opacity: 1;
  }

  44% {
    opacity: 0.97;
  }

  46% {
    opacity: 0.94;
  }

  56% {
    opacity: 0.9;
  }

  58% {
    opacity: 0.9;
  }

  60% {
    opacity: 0.99;
  }

  68% {
    opacity: 1;
  }

  70% {
    opacity: 0.9;
  }

  72% {
    opacity: 0.95;
  }

  93% {
    opacity: 0.93;
  }

  95% {
    opacity: 0.95;
  }

  97% {
    opacity: 0.93;
  }

  to {
    opacity: 1;
  }
}
</style>