<template>
  <v-app id="inspire2">
    <v-container class="m-10" fluid>
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

      <!-- search bar -->
      <v-row style="height: 120px">
        <v-col>
          <h3
            class="white--text"
            style="font-family: 'Caveat', cursive; font-size: 26px"
          >
            Videos Gallary
          </h3>
          <search
            :toolbarColor="switch1 ? color.color2 : color.color2"
            toolbarTitle="videos selection"
            inputColor=""
            itemColor=""
            :light="false"
            :data="videos"
            :states="states"
            @selectionAdded="GetSearchIndex"
            @reset="resetSelect"
          />

        </v-col>
      </v-row>

      <!-- videos slider -->
      <v-progress-circular
        v-if="videos.length <= 1"
        :size="200"
        :width="10"
        color="red "
        class="mt-10"
        indeterminate
      ></v-progress-circular>

      <v-row v-if="videos.length > 1">
        <v-col cols="12">
          <!-- :controls-prev-html="'&#128072;&#127996; '" :controls-next-html="'&#128073;&#127996;'" -->
          <!-- :controls-prev-html="'⏪'"
            :controls-next-html="'⏩'" -->
          <carousel-3d
            :controls-width="60"
            :controls-height="0"
            :controls-visible="true"
            :clickable="true"
            :height="455"
            :width="500"
            :display="10"
            :loop="true"
            :perspective="60"
            :autoplay="false"
            v-if="select == null"
            @after-slide-change="onAfterSlideChange"
            @click="stop()"
          >
            <!-- :onMainSlideClick="" -->
            <slide :index="i" :key="i" v-for="(video, i) in videos">
              <figure>
                <!-- <video
                  class="video"
                  style="background-color: #212121"
                  ref="mycarousel"
                  width="500"
                  height="400"
                  controls
                  src="https://www.youtube.com/embed/tgbNymZ7vqY"
                  :thumb="video.thumb"
                /> -->
                <iframe
                  ref="mycarousel"
                  class="video"
                  style="background-color: rgb(0 0 0)"
                  width="100%"
                  height="380"
                  frameborder="0"
                  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen
                  :src="video.sources[0]"
                >
                </iframe>
                <figcaption
                  style="position: absolute; bottom: -30px; height: 2rem"
                >
                  <v-btn text color="white">{{ video.title }}</v-btn>
                  <!-- <v-btn text color="white">{{ i }}</v-btn> -->
                </figcaption>

                <v-card-title
                  class="
                    swip
                    text-h6
                    d-block
                    text-light text-center
                    pa-0
                    mx-auto
                    bg-dark
                  "
                  style="cursor: pointer"
                >
                  <v-btn class="ma-2" outlined color="orange">
                    <v-icon left>mdi-arrow-left-circle-outline</v-icon>
                    Swip Here
                    <v-icon right>mdi-arrow-right-circle-outline</v-icon>
                  </v-btn>
                </v-card-title>
              </figure>

                <commentTemp1
                v-if="!select"
                type="Video"
                :MainColor="switch1 ? color.color3 : color.color2"
                :data="video"
                :badgeColor="switch1 ? color.color1 : 'pink lighten-1'"
                :Maintitle="`Tell Me What your opinion in ${video.title} Video`"
                :index="i"
              >
                <iframe
                    class="video"
                    style="background-color: #212121"
                    width="100%"
                    height="400"
                    frameborder="10"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen
                    :src="video.sources[0]"
                  />
              </commentTemp1>

            </slide>
          </carousel-3d>

          <div class="text-center">
            <!-- <v-snackbar
              bottom
              vertical
              v-model="snackbar.snackbar"
              :timeout="snackbar.timeout"
              color="teal lighten-0"
            >
              <span class="text-h6">{{ snackbar.text }}</span>
            </v-snackbar> -->

            <v-row justify="center">
              <v-col cols="12" sm="8" md="6">
                <v-card>
                  <v-toolbar
                    :color="switch1 ? color.color3 : color.color2"
                    dark
                    bottom
                    extension-height
                    min-height="fit-content"
                    :rounded="true"
                    :shaped="true"
                    v-model="title.snackbar"
                  >
                    <v-toolbar-title class="ma-auto text-h6">
                      {{ select || title.text }}
                    </v-toolbar-title>
                  </v-toolbar>
                </v-card>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>

      <!-- selected video -->
      <v-row class="d-flex justify-center mb-10" v-if="select">
        <v-col cols="12">
          <div class="images-wrapper">
            <figure>
              <iframe
                preload="none"
                class="grey lighten-2 image selected-video position-relative"
                v-if="select"
                :width="680"
                :height="480"
                frameborder="0"
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
                :src="selectedVideo[0].sources[0]"
              >
              </iframe>

              <!-- <figcaption
              style="position: absolute; top: 0px; height: fit-content"
            >
              <v-btn text color="white">{{ selectedVideo[0].title }}</v-btn>
              <v-btn text color="white">{{ ii }}</v-btn>
            </figcaption> -->
            <div class="select-comment">
              <commentTemp1
              v-if="select"
              type="Video"
              :MainColor="switch1 ? color.color3 : color.color2"
              :data="selectedVideo[0]"
              :badgeColor="switch1 ? color.color1 : 'pink lighten-1'"
              :Maintitle="`Tell Me What your opinion in ${selectedVideo[0].title} Video`"
              :index="ii"
            >
              <iframe
                  class="video"
                  style="background-color: #212121"
                  width="100%"
                  height="400"
                  frameborder="10"
                  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen
                  :src="selectedVideo[0].sources[0]"
                />
            </commentTemp1>
            </div>

            </figure>
          </div>
        </v-col>
      </v-row>
      <v-snackbar v-model="snackbar1" :timeout="2000">
        {{ resp }}
        <template v-slot:action="{ attrs }">
          <v-btn color="blue" text v-bind="attrs" @click="snackbar1 = false">
            Close
          </v-btn>
        </template>
      </v-snackbar>
    </v-container>
    <Message />
    <!-- <h1 style="color:white">{{ resp }}</h1> -->
    <!-- {{ videos }} -->
    <!-- {{ snackbar1 }} -->
  </v-app>
</template>

<script>
import "vue-cool-lightbox/dist/vue-cool-lightbox.min.css";
import { Carousel3d, Slide } from "vue-carousel-3d";
import search from "../components/subComment/search";
import commentTemp1 from "../components/subComment/commentTemp1.vue";
// import videosjson from "./videos.json";
import yt from "./yt.js";

export default {
  name: "Videos",
  data: () => ({
    valid: true,
    dialog: {},
    index: null,
    videos: [
      {},
      // {
      //   description: "The first Blender Open Movie from 2006",
      //   sources: [
      //     // "https://www.youtube.com/embed/zP601i-x0O4",
      //   ],
      //   subtitle: "By Blender Foundation",
      //   thumb:
      //     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
      //   title: "Elephant Dream",
      //   comments: [],
      // },
    ],
    //  [videosjson][0].videos,

    rules: [
      (value) => !!value || "Required.",
      (value) => (value && value.length >= 3) || "Min 3 characters",
    ],

    // search
    select: null,
    states: [],
    // selectedVideo:null,
    selectedVideo: [
      {
        description: "The first Blender Open Movie from 2006",
        sources: ["https://www.youtube.com/embed/zP601i-x0O4"],
        subtitle: "By Blender Foundation",
        thumb:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
        title: "Elephant Dream",
        comments: [],
      },
    ],
    //comment
   
    commentDialog: {},
    resp: "",
    snackbarDelete: false,
    snackbar1: false,
    vertical: true,
    // slide
    slides: 10,
    title: {
      snackbar: false,
      text: "",
    },
    ii: 1,
    switch1: false,
  }),
  components: {
    Carousel3d,
    Slide,
    search,
    commentTemp1,
  },

  created() {
    yt({ apiKey: "AIzaSyDdK82uTv5IFGcMN9n1qSLRumzLf1z_i9U" }, (response) => {
      this.videos = [];
      this.videos = response.filter((video) => {
        return video.title != "Deleted video";
      });
      // console.log(this.videos);
      for (let n = 0; n < this.videos.length; n++) {
        this.states[n] = this.videos[n].title;
        this.videos[n].comments = response[n].comments;
        // JSON.parse(localStorage.getItem(`VideoCommentsOf${n}`)) || [];

        // author
        if (
          window.localStorage.getItem(`VideoCommentsOf${n}`) !== null &&
          this.videos[n].comments
        ) {
          var x = 0; // local storage index
          for (let i = 0; i < this.videos[n].comments.length; i++) {
            if (
              JSON.parse(localStorage.getItem(`VideoCommentsOf${n}`))[x] &&
              this.videos[n].comments[i].id ==
                JSON.parse(localStorage.getItem(`VideoCommentsOf${n}`))[x].id
            ) {
              this.videos[n].comments[i].author = JSON.parse(
                localStorage.getItem(`VideoCommentsOf${n}`)
              )[x].author;
              this.videos[n].comments[i].color = JSON.parse(
                localStorage.getItem(`VideoCommentsOf${n}`)
              )[x].author
                ? "pink"
                : this.videos[n].comments[i].color;
              x++;
            }
          }
        } //end author
      }
      this.title.text = this.states[0];
    });
    // darkmode
    this.colorDark();
  },
  methods: {
    // search
    GetSearchIndex(index, select) {
      this.ii = index;
      this.selectedVideo[0] = this.videos[this.ii];
      this.select = select;
      this.title.text = select;
      // console.log(this.selectedVideo, this.select);
    },
    resetSelect(select) {
      this.select = select;
      this.title.text = this.states[0];
    },

    onAfterSlideChange(index) {
      // console.log(
      //   "@onBeforeSlideChange Callback Triggered",
      //   "Slide Index " + index
      // );
      // console.log(
      //   this.$refs.mycarousel[index].nextSibling.children[0].innerText
      // );
      // console.log(index);
      // console.log(
      //   this.$refs.mycarousel
      // );
      this.title.snackbar = true;
      this.title.text =
        this.$refs.mycarousel[index].nextSibling.children[0].innerText;

      for (let i = 0; i < this.$refs.mycarousel.length; i++) {
        this.$refs.mycarousel[i].contentWindow.postMessage(
          '{"event":"command","func":"stopVideo","args":""}',
          "*"
        );
      }
      // console.log(this.$refs.mycarousel[index].attributes.thumb.nodeValue);
      // let bg = this.$refs.mycarousel[index].attributes.thumb.nodeValue;
      let bg = this.videos[index].thumbnails.high.url;

      document.getElementById("inspire2").style.backgroundImage = `url(${bg})`;
    },
    // stop video when change
    stop() {
      for (let i = 0; i < this.$refs.mycarousel.length; i++) {
        this.$refs.mycarousel[i].contentWindow.postMessage(
          '{"event":"command","func":"stopVideo","args":""}',
          "*"
        );
      }
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

<style >
.next span,
.prev span {
  color: #c02942;
  font-weight: bolder;
  /* background-color: azure; */
  width: 20px;
  max-height: 40px;
}
</style>
<style lang="scss" scoped>
#inspire2 {
  min-height: 100%;
  background: url("../assets/img/videos.gif") rgba(0, 0, 0, 0.5);
  background-size: cover;
  background-blend-mode: multiply;
  background-origin: bottom right;
  background-attachment: fixed;
  background-position: bottom center;
}
.image {
  box-shadow: -10px 10px 15px black;
  overflow: hidden;
  transition: 0.5s ease;
}

.images-wrapper {
  position: relative;
}
.images-wrapper:hover .overlay {
  opacity: 0.8;
  transform: translate(0%, -15%);
}
.images-wrapper:hover .image {
  transform: scale(105%);
}
.comment-btn {
  position: absolute;
  bottom: 15px;
  right: 0px;
  font-size: 0.5rem;
  width: fit-content;
  padding: 10px !important;
  border-radius: 15px;
  height: 30px !important;
  min-width: 20px !important;
}
.select-comment {
  position: absolute;
  bottom: -40px;
  // top: 0px;
  right: 45%;
}
// button
.reply--button {
  position: static;
  right: -100px;
  border: 1px solid #2a629c;
  background-color: transparent;
  color: #2a629c;
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  // padding: 0.375rem 0.75rem;
  padding: 8px;
  font-size: 15px;
  line-height: 1.5;
  border-radius: 30px;
  transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out,
    border-color 0.25s ease-in-out, box-shadow 0.25s ease-in-out,
    right 0.25s ease-in-out;
}
.reply--button:hover {
  padding: 8px;
  border-radius: 25px;
  color: #fff;
  background-color: #2a629c;
}
.reply--button:focus,
.reply--button:active {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
.carousel-3d-slide {
  background-color: #000;
}
.carousel-3d-controls[data-v-05517ad0] {
  color: #fff;
}
.next span,
.prev span {
  color: orange;
}

.swip {
  font-style: italic;
  font-weight: bolder;
}
.commentContent {
  background-color: #f1f1f1;
  padding: 10px;
  border-radius: 15px;
}
.commentContent > * {
  // background-color: aqua;
  margin: 10px 0px;
  border-radius: 25px;
}
//
@media screen and (max-width: 768px) {
  .video {
    width: 100%;
    height: auto;
    min-height: 300px;
  }
  .selected-video {
    height: 280px;
    width: 380px;
  }
  .carousel-3d-slide {
    min-height: 240px;
  }
  .comment-btn {
    position: absolute;
    top: 15px;
    right: 0px;
    font-size: 0.5rem;
    width: fit-content;
    padding: 10px !important;
    border-radius: 15px;
    height: 30px !important;
    min-width: 20px !important;
  }
}
</style>