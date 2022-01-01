<template>
  <v-app id="inspire2">
    <v-container fluid class="">
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

      <v-row>
        <v-col :lg="9" :sm="12">
          <v-card-title
            class="text-h5 bg-dark d-block text-center text-light rounded-3"
            >Latest News
          </v-card-title>

          <v-card color="transparent">
            <v-tabs
              color="red accent-0"
              class=""
              :icons-and-text="true"
              centered
              dark
              v-model="tabs"
              style="background-color: transparent"
            >
              <v-tab @click="cat('All')">All</v-tab>
              <v-tab @click="cat('Video')">Video</v-tab>
              <v-tab @click="cat('Music')">Music</v-tab>
              <v-tab @click="cat('Life')">Events</v-tab>
              <v-tab @click="cat('Social')">Social</v-tab>

              <v-tabs-items
                v-model="tabs"
                style="background-color: transparent"
              >
                <v-tab-item
                  v-for="n in 5"
                  :key="n"
                  style="background-color: transparent"
                >
                  <v-container fluid>
                    <v-row style="background-color: transparent">
                      <v-col
                        :lg="12"
                        :md="12"
                        :sm="6"
                        v-for="(item, i) in SelectedItems"
                        :key="i"
                      >
                        <v-card
                          :color="switch1 ? '#fff' : color.color1"
                          :light="switch1"
                          :dark="!switch1"
                          height="100%"
                          width="100%"
                          class="overflow-hidden"
                        >
                          <v-row>
                            <v-col style="height: auto; width: auto">
                              <v-img
                                :src="item.src"
                                min-width="300px"
                                max-width="500px"
                                min-height="300px"
                                max-height="500px"
                                width="100%"
                                height="100%"
                                aspect-ratio="1"
                              >
                                <template v-slot:placeholder>
                                  <v-row
                                    class="fill-height ma-0"
                                    align="center"
                                    justify="center"
                                  >
                                    <v-progress-circular
                                      indeterminate
                                      :color="
                                        switch1
                                          ? color.color1
                                          : 'grey lighten-5'
                                      "
                                    ></v-progress-circular>
                                  </v-row>
                                </template>
                              </v-img>
                            </v-col>
                            <v-col>
                              <div class="pa-1">
                                <v-card-title
                                  class="text-h4"
                                  style="word-break: keep-all"
                                  v-text="item.title"
                                ></v-card-title>
                                <v-card-subtitle
                                  v-text="item.subTitle"
                                ></v-card-subtitle>

                                <v-chip
                                  style="width: fit-content"
                                  class="ma-2 d-flex"
                                  color="pink"
                                  label
                                  text-color="white"
                                >
                                  <v-icon left> mdi-label </v-icon>
                                  {{ item.category }}
                                </v-chip>

                                <v-card-text
                                  class="text-h6 text-left mb-10"
                                  v-html="item.description"
                                >
                                </v-card-text>
                                <v-card-actions
                                  style="position: absolute; bottom: 0px"
                                >
                                  <v-list-item class="grow">
                                    <v-row align="center" class="flex-nowrap">
                                      <v-btn
                                        color="transparent"
                                        @click="likes(i, $event)"
                                        depressed
                                      >
                                        <v-icon
                                          class="mr-1 heart"
                                          :color="
                                            item.likes.bol ? '#c80303' : ''
                                          "
                                          >mdi-heart
                                        </v-icon>
                                        <span class="subheading mr-2">
                                          {{ item.likes.number }}
                                        </span>
                                      </v-btn>

                                      <v-btn
                                        color="transparent"
                                        depressed
                                        :href="item.share.link"
                                        target="_blank"
                                        @click="share(i, $event)"
                                      >
                                        <v-icon
                                          class="mr-1 share"
                                          :color="
                                            item.share.bol ? '#a15ba1' : ''
                                          "
                                        >
                                          mdi-share-variant
                                        </v-icon>
                                        <span class="subheading mr-5">
                                          {{ item.share.number }}
                                        </span>
                                      </v-btn>
                                      <!-- comment -->
                                      <v-dialog
                                        class="dialog"
                                        v-model="dialog[i]"
                                        width="600px"
                                        :retain-focus="false"
                                      >
                                        <template
                                          v-slot:activator="{ on, attrs }"
                                        >
                                          <v-btn
                                            class="justify-center"
                                            color="pink"
                                            dark
                                            v-bind="attrs"
                                            v-on="on"
                                          >
                                            <v-badge
                                              :content="item.comments.length"
                                              :value="item.comments.length"
                                              :color="
                                                switch1
                                                  ? color.color4
                                                  : 'red darken-4'
                                              "
                                              overlap
                                            >
                                              <v-icon>mdi-comment-text</v-icon>
                                              <!-- class="d-none d-sm-inline" -->
                                              <span>comments</span>
                                            </v-badge>
                                          </v-btn>
                                        </template>
                                        <v-card
                                          :style="{
                                            backgroundColor: switch1
                                              ? 'white'
                                              : color.color1,
                                          }"
                                        >
                                          <v-card-title>
                                            <v-row>
                                              <v-col cols="10">
                                                <span
                                                  class="
                                                    text-h5
                                                    font-weight-black
                                                    Kaushan
                                                  "
                                                  style="
                                                    word-break: break-word;
                                                    font-family: 'Kaushan Script',
                                                      cursive !important;
                                                  "
                                                  :style="{
                                                    color: switch1
                                                      ? ''
                                                      : color.color5,
                                                  }"
                                                >
                                                  Tell Me What you feel About
                                                  {{ item.title }}
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

                                          <v-form
                                            ref="form1"
                                            v-model="valid"
                                            lazy-validation
                                            id="form"
                                            @submit.prevent="
                                              submitComment(i, $event)
                                            "
                                            style="
                                              background-color: pink;
                                              padding: 5px;
                                              border-radius: 15px;
                                            "
                                          >
                                            <v-card-text class="mt-0">
                                              <div class="reply">
                                                <input type="hidden" />

                                                <v-text-field
                                                  color="#1e1e1e"
                                                  tag="input"
                                                  v-model.trim="name"
                                                  label="Your name"
                                                  :rules="rules"
                                                  hide-details="auto"
                                                ></v-text-field>

                                                <v-text-field
                                                  color="#1e1e1e"
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
                                                name == '' ||
                                                message == '' ||
                                                valid == false
                                              "
                                              type="submit"
                                              class="reply--button"
                                              @click.prevent="
                                                submitComment(i, $event)
                                              "
                                            >
                                              <i class="fa fa-paper-plane"></i>
                                              Send &nbsp;
                                            </button>
                                          </v-form>

                                          <v-card
                                            width="100%"
                                            height="100%"
                                            class="overflow-auto"
                                            v-if="item.comments.length == 0"
                                          >
                                            <v-card-text
                                              :style="{
                                                backgroundColor: switch1
                                                  ? 'white'
                                                  : color.color1,
                                              }"
                                            >
                                              <h3
                                                class="
                                                  font-weight-black font-italic
                                                "
                                                :style="{
                                                  color: switch1
                                                    ? ''
                                                    : color.color4,
                                                }"
                                              >
                                                Be The First One To Comment
                                              </h3>
                                            </v-card-text>
                                          </v-card>

                                          <!-- <v-divider class="mt-5"></v-divider> -->
                                          <v-card
                                            v-if="item.comments.length !== 0"
                                            :light="switch1"
                                            :dark="!switch1"
                                          >
                                            <v-card-text>
                                              <div
                                                class="
                                                  font-weight-bold
                                                  ml-8
                                                  mb-2
                                                "
                                              >
                                                Other Comments
                                                <v-divider
                                                  class="mt-2"
                                                ></v-divider>
                                              </div>
                                              <v-timeline align-top dense>
                                                <v-timeline-item
                                                  v-for="(
                                                    comment, p
                                                  ) in item.comments"
                                                  :key="p"
                                                  :color="comment.color"
                                                  small
                                                >
                                                  <div>
                                                    <div
                                                      class="
                                                        font-weight-normal
                                                        text-left
                                                      "
                                                    >
                                                      <strong
                                                        class="Kaushan"
                                                        :style="{
                                                          color: switch1
                                                            ? ''
                                                            : color.color5,
                                                        }"
                                                      >
                                                        {{
                                                          comment.name.toLocaleUpperCase()
                                                        }}</strong
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
                                                        color="transparent"
                                                        v-if="comment.author"
                                                        class="comment-btn"
                                                        width="60px"
                                                        style="
                                                          position: absolute;
                                                          right: 5px;
                                                        "
                                                      >
                                                        <v-dialog
                                                          v-model="
                                                            commentDialog[
                                                              comment.id
                                                            ]
                                                          "
                                                          width="600px"
                                                          :retain-focus="false"
                                                          dark
                                                        >
                                                          <template
                                                            v-slot:activator="{
                                                              on,
                                                              attrs,
                                                            }"
                                                          >
                                                            <v-btn
                                                              class="
                                                                justify-center
                                                              "
                                                              color="blue"
                                                              dark
                                                              v-bind="attrs"
                                                              v-on="on"
                                                              small
                                                              icon
                                                              width="20"
                                                              @click.prevent="
                                                                () => {
                                                                  Editname =
                                                                    comment.name;
                                                                  Editmessage =
                                                                    comment.message;
                                                                }
                                                              "
                                                            >
                                                              <v-icon small
                                                                >mdi-comment-edit</v-icon
                                                              >
                                                            </v-btn>
                                                          </template>
                                                          <v-card>
                                                            <v-btn
                                                              depressed
                                                              color="error"
                                                              style="
                                                                min-width: 20px;
                                                                position: absolute;
                                                                top: 0px;
                                                                right: 0px;
                                                              "
                                                              @click="
                                                                commentDialog[
                                                                  comment.id
                                                                ] = false
                                                              "
                                                            >
                                                              x
                                                            </v-btn>
                                                            <v-form
                                                              id="form"
                                                              v-model="valid"
                                                            >
                                                              <v-card-text
                                                                class="mt-5"
                                                              >
                                                                <div
                                                                  class="reply"
                                                                >
                                                                  <input
                                                                    type="hidden"
                                                                  />
                                                                  <v-text-field
                                                                    tag="input"
                                                                    v-model.trim="
                                                                      Editname
                                                                    "
                                                                    label="Your name"
                                                                    :rules="
                                                                      rules
                                                                    "
                                                                    hide-details="auto"
                                                                    :validate-on-blur="
                                                                      true
                                                                    "
                                                                  ></v-text-field>

                                                                  <v-text-field
                                                                    tag="input"
                                                                    v-model.trim="
                                                                      Editmessage
                                                                    "
                                                                    label="Your comment"
                                                                    :rules="
                                                                      rules
                                                                    "
                                                                    hide-details="auto"
                                                                  ></v-text-field>
                                                                </div>
                                                              </v-card-text>
                                                              <button
                                                                :disabled="
                                                                  Editname ==
                                                                    '' ||
                                                                  Editmessage ==
                                                                    '' ||
                                                                  valid == false
                                                                "
                                                                type="button"
                                                                class="
                                                                  reply--button
                                                                  mb-5
                                                                "
                                                                @click.prevent="
                                                                  editComment(
                                                                    i,
                                                                    p
                                                                  )
                                                                "
                                                              >
                                                                <i
                                                                  class="
                                                                    fa
                                                                    fa-paper-plane
                                                                  "
                                                                ></i>
                                                                Send &nbsp;
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
                                                          <v-icon small
                                                            >mdi-trash-can</v-icon
                                                          >
                                                        </v-btn>
                                                        <v-snackbar
                                                          v-model="
                                                            snackbarDelete
                                                          "
                                                          :vertical="vertical"
                                                          shaped
                                                          centered
                                                          :timeout="-1"
                                                        >
                                                          Do You Want To Delete
                                                          Your Comment
                                                          <template
                                                            v-slot:action="{
                                                              attrs,
                                                            }"
                                                          >
                                                            <v-btn
                                                              color="pink"
                                                              text
                                                              v-bind="attrs"
                                                              @click.prevent="
                                                                deleteComment(
                                                                  i,
                                                                  com
                                                                )
                                                              "
                                                            >
                                                              Yes
                                                            </v-btn>
                                                            <v-btn
                                                              color="pink"
                                                              text
                                                              v-bind="attrs"
                                                              @click="
                                                                snackbarDelete = false
                                                              "
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
                                      <!-- end of comment  -->
                                    </v-row>
                                  </v-list-item>
                                </v-card-actions>
                              </div>
                            </v-col>
                          </v-row>
                        </v-card>
                      </v-col>
                    </v-row>
                                          <v-snackbar v-model="snackbar" :timeout="2000">
                        {{ resp }}
                        <template v-slot:action="{ attrs }">
                          <v-btn
                            color="blue"
                            text
                            v-bind="attrs"
                            @click="snackbar = false"
                          >
                            Close
                          </v-btn>
                        </template>
                      </v-snackbar>
                  </v-container>
                </v-tab-item>
              </v-tabs-items>
            </v-tabs>
          </v-card>
          <v-progress-circular
            v-if="!api"
            :size="200"
            :width="10"
            color="red "
            class="mt-4"
            indeterminate
          ></v-progress-circular>
        </v-col>

        <v-col lg="3" :sm="12">
          <v-container>
            <v-row justify="space-around">
              <v-card width="400" :light="switch1" :dark="!switch1">
                <v-img height="90px" src="../assets/img/m3.jpg">
                  <v-card-title class="white--text mt-0">
                    <p class="">News Dates</p>
                  </v-card-title>
                </v-img>
                <v-card-text>
                  <div class="font-weight-bold ml-8 mb-2">Dates</div>
                  <v-timeline align-top dense>
                    <!-- :key="message.time" -->
                    <v-timeline-item
                      v-for="message in messages"
                      :color="message.color"
                      :key="message.id"
                      small
                      left
                    >
                      <div>
                        <div class="font-weight-normal text-left">
                          <strong>{{ message.Title }}</strong>
                          @{{ message.time }}
                        </div>
                        <!-- <div>{{ message.message }}</div> -->
                      </div>
                    </v-timeline-item>
                  </v-timeline>
                </v-card-text>
              </v-card>
            </v-row>
          </v-container>
        </v-col>
      </v-row>
    </v-container>
    <Message />
  </v-app>
</template>

<script>
import ButtonsSocial from "../components/ButtonsSocial.vue";
import Message from "../components/message";

export default {
  name: "News",
  data: () => ({
    valid: true,
    SelectedItems: null,
    tabs: null,
    colors: [
      "deep-purple lighten-1",
      "green",
      "red",
      "green",
      "deep-orange lighten-1",
      "green",
      "blue lighten-1",
    ],
    messages: [
      {
        Title: "You",
        time: "10:42am",
        color: "deep-purple lighten-1",
      },
      {
        Title: "John Doe",
        time: "10:37am",
        color: "green",
      },
      {
        Title: "You",
        time: "9:47am",
        color: "deep-purple lighten-1",
      },
    ],
    items: [
      {
        color: "#1F7087",
        src: `https://picsum.items/500/300?image=${Math.floor(
          Math.random() * 11
        )}`,
        title: "Supermodel",
        subTitle: "Foster the People",
        description:
          "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
        likes: { bol: false, number: 256 },
        share: { link: "https://www.facebook.com/", number: 35, bol: false },
        category: "Life",
      },
      {
        color: "#952175",
        src: "https://cdn.vuetifyjs.com/images/cards/halcyon.png",
        title: "Halcyon Days",
        subTitle: "Ellie Goulding",
        description:
          "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
        likes: { bol: false, number: 250 },
        share: { link: "https://www.facebook.com/", number: 45, bol: false },
        category: "Music",
      },
      {
        color: "#952175",
        src: "https://cdn.vuetifyjs.com/images/cards/halcyon.png",
        title: "Halcyon Days",
        subTitle: "Ellie Goulding",
        description:
          "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
        likes: { bol: false, number: 250 },
        share: { link: "https://www.facebook.com/", number: 45, bol: false },
        category: "Video",
      },
      {
        color: "#952175",
        src: "https://cdn.vuetifyjs.com/images/cards/halcyon.png",
        title: "Halcyon Days 2",
        subTitle: "Ellie Goulding 2",
        description:
          "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
        likes: { bol: false, number: 250 },
        share: { link: "https://www.facebook.com/", number: 45, bol: false },
        category: "Video",
      },
      {
        color: "#952175",
        src: "https://cdn.vuetifyjs.com/images/cards/halcyon.png",
        title: "Halcyon Days Social",
        subTitle: "Ellie Goulding",
        description:
          "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well.",
        likes: { bol: false, number: 250 },
        share: { link: "https://www.facebook.com/", number: 45, bol: false },
        category: "Social",
      },
    ],
    rules: [
      (value) => !!value || "Required.",
      (value) => (value && value.length >= 3) || "Min 3 characters",
    ],
    // comment
    dialog: {},
    Newslength: 0,
    DataComment: [],
    SelectedItemIndex: 0,

    //comment
    name: "",
    message: "",
    Editname: "",
    Editmessage: "",
    com: "",
    commentDialog: {},
    ii: 0,
    resp: "",
    snackbar: false,
    snackbarDelete: false,
    vertical: true,
    switch1: false,
  }),
  components: {
    ButtonsSocial,
    Message,
  },
  beforeCreate() {
    // likes&share
    // for (let n = 0; n < this.items.length; n++) {
    //   this.items[n].likes =
    //     JSON.parse(localStorage.getItem(`NewsLikesOf${n}`)) ||
    //     this.items[n].likes;
    //   this.items[n].share =
    //     JSON.parse(localStorage.getItem(`NewsShareOf${n}`)) ||
    //     this.items[n].share;
    // }
  },
  methods: {
    likes(i) {
      this.SelectedItems[i].likes.bol = !this.SelectedItems[i].likes.bol;
      if (this.SelectedItems[i].likes.bol == true) {
        this.SelectedItems[i].likes.number++;

        // ADD TO BACKEND
        const axios = require("axios");
        let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/News/addLike/${this.SelectedItems[i].id}`;
        axios
          .get(base_url)
          // .then((response) => {
          //   var Data1 = response.data.data;
          //   console.log(Data1);
          // })
          .catch((error) => {
            console.log(error);
            this.errored = true;
          });
      } else {
        this.SelectedItems[i].likes.number--;
        const axios = require("axios");
        let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/News/subLike/${this.SelectedItems[i].id}`;
        axios
          .get(base_url)
          // .then((response) => {
          //   var Data2 = response.data.data;
          //   // this.items[i] = Data2;
          //   console.log(Data2);
          // })
          .catch((error) => {
            console.log(error);
            this.errored = true;
          });
      }

      localStorage.setItem(
        `NewsLikesOf${i}`,
        JSON.stringify(this.SelectedItems[i].likes)
      );
    },
    share(i) {
      this.SelectedItems[i].share.bol = true;
      if (this.SelectedItems[i].share.bol == true) {
        this.items[i].share.number++;

        const axios = require("axios");
        let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/News/addShare/${this.SelectedItems[i].id}`;
        axios
          .get(base_url)
          // .then((response) => {
          //   var Data3 = response.data.data;
          //   // this.items[i] = Data2;
          //   console.log(Data3);
          // })
          .catch((error) => {
            console.log(error);
            this.errored = true;
          });
      }
      localStorage.setItem(
        `NewsShareOf${i}`,
        JSON.stringify(this.SelectedItems[i].share)
      );
    },
    // tabs
    cat(value) {
      if (value == "All") {
        this.SelectedItems = this.items;
      } else {
        this.SelectedItems = this.items.filter((e) => {
          return e.category == value;
        });
      }
      // console.log(this.SelectedItems);
      this.messages = [];
      for (let n = 0; n < this.SelectedItems.length; n++) {
        this.messages[n] = {
          Title: this.SelectedItems[n].title,
          time: this.SelectedItems[n].Date,
          color: this.colors[Math.floor(Math.random() * this.colors.length)],
        };
      }
    },
    //date
    getRandomDate(from, to) {
      from = from.getTime();
      to = to.getTime();
      return new Date(from + Math.random() * (to - from));
    },
    async getApi() {
      // Date news
      var d1 = new Date(2020, 1, 20);
      var d2 = new Date(2020, 12, 30);
      var options = {
        weekday: "short",
        year: "numeric",
        month: "long",
        day: "numeric",
      };

      // api
      const axios = require("axios");
      var base_url =
        "http://192.168.1.10/music%20project/music%20project/public/api/News";
      await axios
        .get(base_url)
        .then((response) => {
          var Data = response.data.data;
          this.items = Data;
          this.SelectedItems = this.items;
          // console.log(this.SelectedItems );

          // get likes from localStorage
          for (let n = 0; n < this.items.length; n++) {
            if (localStorage.getItem(`NewsLikesOf${n}`) !== null) {
              this.items[n].likes.bol = JSON.parse(
                localStorage.getItem(`NewsLikesOf${n}`)
              ).bol;
            }
            if (localStorage.getItem(`NewsShareOf${n}`) !== null) {
              this.items[n].share.bol = JSON.parse(
                localStorage.getItem(`NewsShareOf${n}`)
              ).bol;
            }

            // Date news
            this.messages[n] = {
              Title: this.items[n].title,
              time:
                this.items[n].Date ||
                this.getRandomDate(d1, d2).toLocaleDateString("en-US", options),
              color:
                this.colors[Math.floor(Math.random() * this.colors.length)],
            };
            //comments
            this.items[n].comments = [];
            this.SelectedItems[n].comments = [];
          }
        })
        .catch((error) => {
          console.log(error);
          this.errored = true;
        });
      this.Newslength = this.items.length;
      // console.log(this.Newslength);
      this.getComets();
    },
    // components
    getComets() {
      const axios = require("axios");
      var base_url =
        "http://192.168.1.10/music%20project/music%20project/public/api/comments/News";
      axios.get(base_url).then((responseComment) => {
        var DataComment = responseComment.data.data;
        this.DataComment = DataComment;
        // console.log(this.DataComment);

        // console.log(this.Newslength);
        for (let n = 0; n <= this.Newslength; n++) {
          if (window.localStorage.getItem(`NewsCommentsOf${n}`) !== null) {
            var Comments = this.DataComment.filter((e) => {
              return e.Number == n;
            });
            var x = 0;
            for (let i = 0; i < Comments.length; i++) {
              if (
                JSON.parse(localStorage.getItem(`NewsCommentsOf${n}`))[x] &&
                Comments[i].id ==
                  JSON.parse(localStorage.getItem(`NewsCommentsOf${n}`))[x].id
              ) {
                // console.log(JSON.parse((localStorage.getItem(`NewsCommentsOf${n}`)))[x].id + " "+ i );
                Comments[i].author = JSON.parse(
                  localStorage.getItem(`NewsCommentsOf${n}`)
                )[x].author;
                Comments[i].color = JSON.parse(
                  localStorage.getItem(`NewsCommentsOf${n}`)
                )[x].author
                  ? "pink"
                  : this.photos[n].comments[i].color;
                x++;
              }
            }
          }
        }
      });
    },
    submitComment(n) {
      var n1 = this.items.indexOf(this.SelectedItems[n]);
      this.SelectedItems[n].comments.push({
        name: this.name,
        message: this.message,
        Number: n1,
        color: "red",
        author: true,
      });
      //api
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/addNewsComment`;
      axios
        .post(base_url, {
          name: this.name,
          message: this.message,
          Number: n1,
          color: "green",
        })
        .then((response) => {
          let Data = response.data;
          this.resp = Data.Success;
          this.snackbar = true;
          var newComment = Data.data;
          // console.log(newComment);
          this.SelectedItems[n].comments[
            this.SelectedItems[n].comments.length - 1
          ] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n1,
            color: "red",
            author: true,
          };

          var authorCommnets = this.items[n1].comments.filter((e) => {
            return e.author == true;
          });
          localStorage.setItem(
            `NewsCommentsOf${n1}`,
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
      // this.dialog[n] = false;
    },

    editComment(n, p) {
      var n1 = this.items.indexOf(this.SelectedItems[n]);
      this.SelectedItems[n].comments[p] = {
        id: this.SelectedItems[n].comments[p].id,
        name: this.Editname,
        message: this.Editmessage,
        Number: n1,
        color: this.SelectedItems[n].comments[p].color,
        author: true,
      };
      //api
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/editNewsComment/${this.SelectedItems[n].comments[p].id}`;
      axios
        .post(base_url, {
          name: this.Editname,
          message: this.Editmessage,
          Number: n1,
          color: "green",
        })
        .then((response) => {
          let Data = response.data;
          this.resp = Data.Success;
          this.snackbar = true;

          var newComment = Data.data;
          this.SelectedItems[n].comments[p] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n1,
            color: this.SelectedItems[n].comments[p].color,
            author: true,
          };
          // console.log(this.tracks[n].comments[p]);
          var authorCommnets = this.items[n1].comments.filter((e) => {
            return e.author == true;
          });

          localStorage.setItem(
            `NewsCommentsOf${n1}`,
            JSON.stringify(authorCommnets)
          );
        });
      // console.log(this.tracks[n].comments[p]);
      this.commentDialog[this.SelectedItems[n].comments[p].id] = false;
      this.Editname = "";
      this.Editmessage = "";
    },
    deleteComment(n, p) {
      // api
      console.log(n);
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/deleteNewsComment/${this.SelectedItems[n].comments[p].id}`;
      axios.post(base_url).then((response) => {
        this.resp = response.data.Success;
        this.snackbar = true;
        // console.log(Data);
        var n1 = this.items.indexOf(this.SelectedItems[n]);
        var authorCommnets = this.items[n1].comments.filter((e) => {
          return e.author == true;
        });
        localStorage.setItem(
          `NewsCommentsOf${n1}`,
          JSON.stringify(authorCommnets)
        );
      });

      this.SelectedItems[n].comments.splice(p, 1);
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
  created() {
    this.getApi();
    this.colorDark();
  },
  computed: {
    api() {
      return this.SelectedItems !== null && this.DataComment !== null;
    },
    color() {
      return this.$store.state.color;
    },
  },
  watch: {
    DataComment(val) {
      this.Newslength = this.items.length;
      // this.getComets();
      // console.log(this.DataComment);
      for (let n = 0; n < this.items.length; n++) {
        this.items[n].comments = val.filter((e) => {
          return e.Number == n;
        });
      }
    },
    color() {
      this.switch1 = this.$store.state.switch;
    },
  },
};
</script>


<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?&family=Kaushan+Script&family=Lobster");
#inspire2 {
  min-height: 100%;
  background: url("../assets/img/m5.jpg") rgba(0, 0, 0, 0.4);
  background-size: cover;
  background-blend-mode: multiply;
  background-origin: bottom right;
  background-attachment: fixed;
  background-position: bottom center;
}
.v-btn:hover .share {
  color: rgb(161, 91, 161);
}
.v-btn:hover .heart {
  color: rgb(200, 3, 3);
}
@media screen and (max-width: 768px) {
  .text-h6 {
    font-size: 15px;
    line-height: 1.75rem;
    padding: 5px;
  }
  .v-btn:hover .heart {
    color: white;
  }
}
//comments
.commentContent {
  background-color: #f1f1f1;
  padding: 10px;
  border-radius: 15px;
}
.commentContent > * {
  margin: 10px 0px;
  border-radius: 25px;
}
.comment-btn {
  position: absolute;
  bottom: 0px;
  right: 0px;
  font-size: 0.5rem;
  width: fit-content;
  padding: 10px !important;
  border-radius: 15px;
  height: 30px !important;
  min-width: 20px !important;
}
// button
.reply--button {
  border: 1px solid #e1e1e1;
  background-color: #1e1e1e;
  color: #f1f1f1;
  font-weight: 400;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  padding: 8px;
  font-size: 15px;
  border-radius: 30px;
  transition: color 0.25s ease-in-out, background-color 0.25s ease-in-out,
    border-color 0.25s ease-in-out, box-shadow 0.25s ease-in-out,
    right 0.25s ease-in-out;
}
.reply--button:disabled {
  background-color: transparent;
}
.reply--button:hover {
  padding: 8px;
  border-radius: 25px;
  color: #fff;
  background-color: #1f1f1f;
}
.reply--button:focus,
.reply--button:active {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  border: 1px solid #2a629c;
}
.Kaushan {
  font-family: "Kaushan Script", cursive !important;
}
</style>