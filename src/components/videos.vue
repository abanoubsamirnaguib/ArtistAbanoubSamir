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
          <v-toolbar
            dark
            :color="switch1 ? color.color2 : color.color2"
            style="border-radius: 25px"
          >
            <v-toolbar-title>videos selection</v-toolbar-title>
            <v-autocomplete
              v-model="select"
              :loading="loading"
              :items="items"
              :search-input.sync="search"
              cache-items
              class="mx-4"
              flat
              hide-no-data
              hide-details
              label="which video do you looking for?"
              solo-inverted
            ></v-autocomplete>
            <v-btn icon @click="select = null">
              <v-icon>mdi-trash-can</v-icon>
            </v-btn>
          </v-toolbar>
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

              <v-dialog v-model="dialog[i]" width="600px" :retain-focus="false">
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    class="justify-center comment-btn"
                    :color="switch1 ? color.color3 : color.color2"
                    dark
                    v-bind="attrs"
                    v-on="on"
                  >
                    <v-badge
                      :content="videos[i].comments.length || 0"
                      :value="videos[i].comments.length || 0"
                      :color="switch1 ? color.color1 : 'pink lighten-1'"
                      overlap
                    >
                      <v-icon>mdi-comment-text</v-icon>
                      <span class="d-none d-sm-inline">comments...</span>
                    </v-badge>
                  </v-btn>
                </template>
                <v-card>
                  <v-card-title
                    :style="{
                      backgroundColor: switch1 ? 'white' : color.color1,
                    }"
                  >
                    <v-row>
                      <v-col cols="10">
                        <span
                          class="text-h5"
                          style="
                            word-break: break-word;
                            font-family: 'Kaushan Script', cursive !important;
                          "
                          :style="{ color: switch1 ? '' : color.color5 }"
                        >
                          Tell Me What your opinion in {{ video.title }} Video
                        </span>
                      </v-col>
                      <v-col cols="2">
                        <v-btn
                          depressed
                          color="error"
                          style="
                            min-width: 20px;
                            position: absolute;
                            top: 0px;
                            right: 0px;
                          "
                          @click="closeDialog(i)"
                        >
                          x
                        </v-btn>
                      </v-col>
                    </v-row>
                  </v-card-title>
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

                  <v-form
                    ref="form1"
                    v-model="valid"
                    lazy-validation
                    id="form"
                    style="
                      background-color: #f1f1f1;
                      padding: 10px;
                      border-radius: 15px;
                    "
                    @submit.prevent="submitComment(i, $event)"
                  >
                    <v-card-text class="mt-5">
                      <div class="reply">
                        <v-text-field
                          tag="input"
                          v-model.trim="name"
                          label="Your name"
                          :rules="rules"
                          hide-details="auto"
                        ></v-text-field>

                        <v-text-field
                          tag="input"
                          v-model.trim="message"
                          label="Your comment"
                          :rules="rules"
                          hide-details="auto"
                        ></v-text-field>
                      </div>
                    </v-card-text>
                    <button
                      :disabled="name == '' || message == '' || valid == false"
                      type="submit"
                      class="reply--button"
                      @click.prevent="submitComment(i, $event)"
                    >
                      <i class="fa fa-paper-plane"></i> Send
                    </button>
                  </v-form>

                  <v-card
                    width="100%"
                    height="100%"
                    class="overflow-auto"
                    v-if="video.comments.length == 0"
                  >
                    <v-card-text
                      :style="{
                        backgroundColor: switch1 ? 'white' : color.color1,
                      }"
                    >
                      <h3
                        class="font-weight-black font-italic"
                        :style="{ color: switch1 ? '' : color.color4 }"
                      >
                        Be The First One To Comment
                      </h3>
                    </v-card-text>
                  </v-card>

                  <v-card
                    v-if="video.comments.length !== 0"
                    :light="switch1"
                    :dark="!switch1"
                  >
                    <v-card-text>
                      <div class="font-weight-bold ml-8 mb-2">
                        Other Comments
                        <v-divider></v-divider>
                      </div>

                      <v-timeline align-top dense>
                        <v-timeline-item
                          v-for="(comment, p) in videos[i].comments"
                          :key="p"
                          :color="comment.color"
                          small
                        >
                          <div>
                            <div class="font-weight-normal text-left">
                              <strong
                                :style="{ color: switch1 ? '' : color.color5 }"
                                style="font-family: 'Kaushan Script', cursive"
                                >{{ comment.name.toLocaleUpperCase() }}</strong
                              >
                            </div>
                            <div
                              class="
                                font-weight-normal
                                text-left
                                commentContent
                              "
                              :style="{
                              backgroundColor: switch1
                                ? '#f1f1f1'
                                : color.color2,
                            }"
                            >
                              {{ comment.message }}

                              <!-- author -->
                              <v-sheet
                                v-if="comment.author"
                                class="comment-btn"
                                width="60px"
                                style="position: absolute; right: 5px"
                                color="transparent"
                              >
                                <!--comment.id or p -->
                                <v-dialog
                                  v-model="commentDialog[comment.id]"
                                  width="600px"
                                  :retain-focus="false"
                                  v-if="!select"
                                  dark
                                  shaped
                                >
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      class="justify-center"
                                      color="blue"
                                      dark
                                      v-bind="attrs"
                                      v-on="on"
                                      small
                                      icon
                                      width="20"
                                      @click.prevent="
                                        () => {
                                          Editname = comment.name;
                                          Editmessage = comment.message;
                                        }
                                      "
                                    >
                                      <v-icon small>mdi-comment-edit</v-icon>
                                    </v-btn>
                                  </template>
                                  <v-card style="border-radius: 15px">
                                    <v-btn
                                      depressed
                                      color="error"
                                      style="
                                        min-width: 20px;
                                        position: absolute;
                                        top: 0px;
                                        right: 0px;
                                      "
                                      @click="closeEditBtn(comment.id, i, p)"
                                    >
                                      x
                                    </v-btn>
                                    <v-form id="editForm" v-model="valid">
                                      <v-card-text class="mt-5">
                                        <div class="reply">
                                          <input type="hidden" />
                                          <v-text-field
                                            tag="input"
                                            v-model.trim="Editname"
                                            label="Your name"
                                            :rules="rules"
                                            hide-details="auto"
                                            :validate-on-blur="true"
                                          ></v-text-field>
                                          <v-text-field
                                            tag="input"
                                            v-model.trim="Editmessage"
                                            label="Your comment"
                                            :rules="rules"
                                            hide-details="auto"
                                          ></v-text-field>
                                        </div>
                                      </v-card-text>
                                      <button
                                        :disabled="
                                          comment.name == '' ||
                                          comment.message == '' ||
                                          valid == false
                                        "
                                        type="submit"
                                        class="reply--button mb-5"
                                        @click.prevent="editComment(i, p)"
                                      >
                                        <i class="fa fa-paper-plane"></i> Send
                                      </button>
                                    </v-form>
                                  </v-card>
                                </v-dialog>
                                <v-btn
                                  class="justify-center"
                                  color="red"
                                  dark
                                  small
                                  icon
                                  width="20"
                                  @click.prevent="
                                    () => {
                                      snackbarDelete = true;
                                      com = p;
                                    }
                                  "
                                >
                                  <v-icon small>mdi-trash-can</v-icon>
                                </v-btn>
                                <v-snackbar
                                  v-model="snackbarDelete"
                                  :vertical="vertical"
                                  shaped
                                  centered
                                  :timeout="-1"
                                >
                                  Do You Want To Delete Your Comment

                                  <template v-slot:action="{ attrs }">
                                    <v-btn
                                      color="pink"
                                      text
                                      v-bind="attrs"
                                      @click="deleteComment(i, com)"
                                    >
                                      Yes
                                    </v-btn>
                                    <v-btn
                                      color="pink"
                                      text
                                      v-bind="attrs"
                                      @click="snackbarDelete = false"
                                    >
                                      No
                                    </v-btn>
                                  </template>
                                </v-snackbar>
                              </v-sheet>
                            </div>
                          </div>
                        </v-timeline-item>
                      </v-timeline>
                    </v-card-text>
                    <v-snackbar v-model="snackbar1" :timeout="2000">
                      {{ resp }}
                      <template v-slot:action="{ attrs }">
                        <v-btn
                          color="blue"
                          text
                          v-bind="attrs"
                          @click="snackbar1 = false"
                        >
                          Close
                        </v-btn>
                      </template>
                    </v-snackbar>
                  </v-card>
                </v-card>
              </v-dialog>
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
                      {{ search || title.text }}
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
              <!-- comment on selected video -->
              <v-dialog
                v-model="dialog[ii]"
                width="600px"
                :retain-focus="false"
                v-if="select"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    class="justify-center comment-btn select-comment"
                    :color="switch1 ? color.color3 : color.color2"
                    dark
                    v-bind="attrs"
                    v-on="on"
                  >
                    <v-badge
                      :content="videos[ii].comments.length || 0"
                      :value="videos[ii].comments.length || 0"
                      :color="switch1 ? color.color1 : 'pink lighten-1'"
                      overlap
                    >
                      <v-icon>mdi-comment-text</v-icon>
                      <span class="d-none d-sm-inline">comments...</span>
                    </v-badge>
                  </v-btn>
                </template>
                <v-card>
                  <v-card-title
                    :style="{
                      backgroundColor: switch1 ? 'white' : color.color1,
                    }"
                  >
                    <v-row>
                      <v-col cols="10">
                        <span
                          class="text-h5"
                          style="
                            word-break: break-word;
                            font-family: 'Kaushan Script', cursive !important;
                          "
                          :style="{ color: switch1 ? '' : color.color5 }"
                        >
                          Tell Me What your opinion in
                          {{ selectedVideo[0].title }} Video
                        </span>
                      </v-col>
                      <v-col cols="2">
                        <v-btn
                          depressed
                          color="error"
                          style="
                            min-width: 20px;
                            position: absolute;
                            top: 0px;
                            right: 0px;
                          "
                          @click="closeDialog(ii)"
                        >
                          x
                        </v-btn>
                      </v-col>
                    </v-row>
                  </v-card-title>
                  <iframe
                    class="video"
                    style="background-color: #212121"
                    width="100%"
                    height="400"
                    :src="selectedVideo[0].sources[0]"
                  >
                  </iframe>

                  <v-form
                    ref="form1"
                    v-model="valid"
                    lazy-validation
                    id="form"
                    style="
                      background-color: #e1e1e1;
                      padding: 10px;
                      border-radius: 15px;
                    "
                    @submit.prevent="submitComment(ii, $event)"
                  >
                    <v-card-text class="mt-5">
                      <div class="reply">
                        <input type="hidden" />

                        <v-text-field
                          tag="input"
                          v-model.trim="name"
                          label="Your name"
                          :rules="rules"
                          hide-details="auto"
                        ></v-text-field>

                        <v-text-field
                          tag="input"
                          v-model.trim="message"
                          label="Your comment"
                          :rules="rules"
                          hide-details="auto"
                        ></v-text-field>
                      </div>
                    </v-card-text>
                    <button
                      :disabled="
                        (name == '' && message == '') || valid == false
                      "
                      type="submit"
                      class="reply--button"
                      @click.prevent="submitComment(ii, $event)"
                    >
                      <i class="fa fa-paper-plane"></i> Send
                    </button>
                  </v-form>

                  <v-card
                    width="100%"
                    height="100%"
                    class="overflow-auto"
                    v-if="selectedVideo[0].comments.length == 0"
                  >
                    <v-card-text
                      :style="{
                        backgroundColor: switch1 ? 'white' : color.color1,
                      }"
                    >
                      <h3
                        class="font-weight-black font-italic"
                        :style="{ color: switch1 ? '' : color.color4 }"
                      >
                        Be The First One To Comment
                      </h3>
                    </v-card-text>
                  </v-card>

                  <v-card
                    v-if="selectedVideo[0].comments.length !== 0"
                    :light="switch1"
                    :dark="!switch1"
                  >
                    <v-card-text>
                      <div class="font-weight-bold ml-8 mb-2">
                        Other Comments<v-divider></v-divider>
                      </div>

                      <v-timeline align-top dense>
                        <v-timeline-item
                          v-for="(comment, p) in videos[ii].comments"
                          :key="p"
                          :color="comment.color"
                          small
                        >
                          <div>
                            <div class="font-weight-normal text-left">
                              <strong
                                style="font-family: 'Kaushan Script', cursive"
                                :style="{ color: switch1 ? '' : color.color5 }"
                                >{{ comment.name.toLocaleUpperCase() }}</strong
                              >
                            </div>
                            <div
                              class="
                                font-weight-normal
                                text-left
                                commentContent
                              "
                              :style="{
                              backgroundColor: switch1
                                ? '#f1f1f1'
                                : color.color2,
                            }"
                            >
                              {{ comment.message }}

                              <!-- author -->
                              <v-sheet
                                v-if="comment.author"
                                class="comment-btn"
                                width="60px"
                                style="position: absolute; right: 5px"
                                color="transparent"
                              >
                                <!--comment.id or p -->
                                <v-dialog
                                  v-model="commentDialog[comment.id]"
                                  width="600px"
                                  :retain-focus="false"
                                  v-if="select"
                                  dark
                                  shaped
                                >
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                      class="justify-center"
                                      color="blue"
                                      dark
                                      v-bind="attrs"
                                      v-on="on"
                                      small
                                      icon
                                      width="20"
                                      @click.prevent="
                                        () => {
                                          Editname = comment.name;
                                          Editmessage = comment.message;
                                        }
                                      "
                                    >
                                      <v-icon small>mdi-comment-edit</v-icon>
                                    </v-btn>
                                  </template>
                                  <v-card style="border-radius: 15px">
                                    <v-btn
                                      depressed
                                      color="error"
                                      style="
                                        min-width: 20px;
                                        position: absolute;
                                        top: 0px;
                                        right: 0px;
                                      "
                                      @click="closeEditBtn(comment.id, ii, p)"
                                    >
                                      x
                                    </v-btn>
                                    <v-form id="editForm" v-model="valid">
                                      <v-card-text class="mt-5">
                                        <div class="reply">
                                          <input type="hidden" />
                                          <v-text-field
                                            tag="input"
                                            v-model.trim="Editname"
                                            label="Your name"
                                            :rules="rules"
                                            hide-details="auto"
                                            :validate-on-blur="true"
                                          ></v-text-field>
                                          <v-text-field
                                            tag="input"
                                            v-model.trim="Editmessage"
                                            label="Your comment"
                                            :rules="rules"
                                            hide-details="auto"
                                          ></v-text-field>
                                        </div>
                                      </v-card-text>
                                      <button
                                        :disabled="
                                          Editname == '' ||
                                          Editmessage == '' ||
                                          valid == false
                                        "
                                        type="button"
                                        class="reply--button mb-5"
                                        @click.prevent="editComment(ii, p)"
                                      >
                                        <i class="fa fa-paper-plane"></i> Send
                                      </button>
                                    </v-form>
                                  </v-card>
                                </v-dialog>
                                <v-btn
                                  class="justify-center"
                                  color="red"
                                  dark
                                  small
                                  icon
                                  width="20"
                                  @click.prevent="
                                    () => {
                                      snackbarDelete = true;
                                      com = p;
                                    }
                                  "
                                >
                                  <v-icon small>mdi-trash-can</v-icon>
                                </v-btn>
                                <v-snackbar
                                  v-model="snackbarDelete"
                                  :vertical="vertical"
                                  shaped
                                  centered
                                  :timeout="-1"
                                >
                                  Do You Want To Delete Your Comment
                                  <template v-slot:action="{ attrs }">
                                    <v-btn
                                      color="pink"
                                      text
                                      v-bind="attrs"
                                      @click="deleteComment(ii, com)"
                                    >
                                      Yes
                                    </v-btn>
                                    <v-btn
                                      color="pink"
                                      text
                                      v-bind="attrs"
                                      @click="snackbarDelete = false"
                                    >
                                      No
                                    </v-btn>
                                  </template>
                                </v-snackbar>
                              </v-sheet>
                            </div>
                          </div>
                        </v-timeline-item>
                      </v-timeline>
                    </v-card-text>
                  </v-card>
                </v-card>
              </v-dialog>
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
import ButtonsSocial from "./ButtonsSocial.vue";
import "vue-cool-lightbox/dist/vue-cool-lightbox.min.css";
import { Carousel3d, Slide } from "vue-carousel-3d";
import Message from "../components/message";
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
    loading: false,
    items: [],
    search: null,
    select: null,
    states: [],
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
    name: "",
    message: "",
    Editname: "",
    Editmessage: "",
    com: "",
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
    ButtonsSocial,
    Carousel3d,
    Slide,
    Message,
  },

  created() {
    yt({ apiKey: "AIzaSyDdK82uTv5IFGcMN9n1qSLRumzLf1z_i9U" }, (response) => {
      this.videos = [];
      this.videos = response;
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
          var x = 0;
          for (let i = 0; i < this.videos[n].comments.length; i++) {
            if (
              JSON.parse(localStorage.getItem(`VideoCommentsOf${n}`))[x] &&
              this.videos[n].comments[i].id ==
                JSON.parse(localStorage.getItem(`VideoCommentsOf${n}`))[x].id
            ) {
              this.videos[n].comments[i].author = JSON.parse(
                localStorage.getItem(`VideoCommentsOf${n}`)
              )[i].author;
              this.videos[n].comments[i].color = JSON.parse(
                localStorage.getItem(`VideoCommentsOf${n}`)
              )[i].author
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
    querySelections(v) {
      this.loading = true;
      // Simulated ajax query
      setTimeout(() => {
        this.items = this.states.filter((e) => {
          return (e || "").toLowerCase().indexOf((v || "").toLowerCase()) > -1;
        });
        this.loading = false;
      }, 500);
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
    submitComment(n) {
      // console.log(this.videos[n].comments);
      this.videos[n].comments.push({
        name: this.name,
        message: this.message,
        Number: n,
        color: "red",
        author: true,
      });

      //api
      const axios = require("axios");
      let base_url =
      //  `http://192.168.1.10/music%20project/music%20project/public/api/comments/addVideoComment`;
       `http://asmusicbackend-07251.herokuapp.com/public/api/comments/addVideoComment`;
      axios
        .post(base_url, {
          name: this.name,
          message: this.message,
          Number: n,
          color: "green",
        })
        .then((response) => {
          let Data = response.data;
          this.resp = Data.Success;
          this.snackbar1 = true;

          var newComment = Data.data;
          this.videos[n].comments[this.videos[n].comments.length - 1] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: "red",
            author: true,
          };

          var authorCommnets = this.videos[n].comments.filter((e) => {
            return e.author == true;
          });
          localStorage.setItem(
            `VideoCommentsOf${n}`,
            JSON.stringify(authorCommnets)
          );
        });
      this.name = "";
      this.message = "";

      this.Editname = "";
      this.Editmessage = "";
      // this.dialog[n] = false;
      if (this.$refs.form1.length > 0) {
        this.$refs.form1.map((el) => {
          el.reset();
        });
      } else this.$refs.form1.reset();
      // console.log(this.videos[n].comments);
    },
    editComment(n, p) {
      // console.log(
      //   "id " + this.videos[n].comments[p].id + " n " + n + " p " + p
      // );
      this.videos[n].comments[p] = {
        id: this.videos[n].comments[p].id,
        name: this.Editname,
        message: this.Editmessage,
        Number: n,
        color: this.videos[n].comments[p].color,
        author: true,
      };
      //api
      const axios = require("axios");
      let base_url =
      //  `http://192.168.1.10/music%20project/music%20project/public/api/comments/editVideoComment/${this.videos[n].comments[p].id}`;
       `http://asmusicbackend-07251.herokuapp.com/public/api/comments/editVideoComment/${this.videos[n].comments[p].id}`;
      axios
        .post(base_url, {
          name: this.Editname,
          message: this.Editmessage,
          Number: n,
          color: "green",
        })
        .then((response) => {
          let Data = response.data;
          this.resp = Data.Success;
          this.snackbar1 = true;

          var newComment = Data.data;
          this.videos[n].comments[p] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: this.videos[n].comments[p].color,
            author: true,
          };
          // console.log(this.videos[n].comments[p]);
          var authorCommnets = this.videos[n].comments.filter((e) => {
            return e.author == true;
          });

          localStorage.setItem(
            `VideoCommentsOf${n}`,
            JSON.stringify(authorCommnets)
          );
        });
      // console.log(this.videos[n].comments[p]);
      this.Editname = "";
      this.Editmessage = "";
      this.commentDialog[this.videos[n].comments[p].id] = false;
    },
    deleteComment(n, p) {
      // console.log(
      //   "id " + this.videos[n].comments[p].id + " n " + n + " p " + p
      // );
      // this.videos[n].comments.shift(p);

      // api
      const axios = require("axios");
      let base_url =
      //  `http://192.168.1.10/music%20project/music%20project/public/api/comments/deleteVideoComment/${this.videos[n].comments[p].id}`;
       `http://asmusicbackend-07251.herokuapp.com/public/api/comments/deleteVideoComment/${this.videos[n].comments[p].id}`;
      axios.post(base_url).then((response) => {
        this.resp = response.data.Success;
        this.snackbar1 = true;
        // console.log(Data);
        var authorCommnets = this.videos[n].comments.filter((e) => {
          return e.author == true;
        });

        localStorage.setItem(
          `VideoCommentsOf${n}`,
          JSON.stringify(authorCommnets)
        );
      });

      this.videos[n].comments.splice(p, 1);
      this.snackbarDelete = false;
    },
    closeEditBtn(id) {
      this.commentDialog[id] = false;
    },
    closeDialog(n) {
      // console.log(this.$refs.form1);
      this.dialog[n] = false;
      if (this.$refs.form1.length > 0) {
        this.$refs.form1.map((el) => {
          el.reset();
        });
      } else this.$refs.form1.reset();

      this.name = "";
      this.message = "";

      this.Editname = "";
      this.Editmessage = "";
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
    search(val) {
      val && val !== this.select && this.querySelections(val);
      if (this.select) {
        this.selectedVideo = this.videos.filter((e, index) => {
          if (e.title == this.select) {
            this.ii = index;
          }
          return e.title == this.select;
        });
        // console.log(this.ii);
      }
    },
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
  bottom: -25px;
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