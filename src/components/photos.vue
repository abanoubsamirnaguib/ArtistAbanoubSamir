1<template>
  <v-app id="inspire2">
    <v-container class="m-10">
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

      <v-row style="height: 120px">
        <v-col>
          <h3
            class="white--text"
            style="font-family: 'Caveat', cursive; font-size: 26px"
          >
            Photos Gallary
          </h3>
          <v-toolbar
            dark
            :color="switch1 ? color.color3 : color.color2"
            style="border-radius: 25px"
          >
            <v-toolbar-title>Photos selection</v-toolbar-title>
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
              label="which photo do you looking for?"
              solo-inverted
            ></v-autocomplete>
            <v-btn icon @click="select = null">
              <v-icon>mdi-trash-can</v-icon>
            </v-btn>
          </v-toolbar>
        </v-col>
      </v-row>

      <v-row v-if="!select">
        <v-col
          v-for="(photo, n) in photos"
          :key="n"
          class="d-flex child-flex pa-lg-5"
          cols="4"
          :lg="4"
          :md="4"
          :sm="6"
        >
          <CoolLightBox
            :items="photos"
            :index="index"
            :useZoomBar="true"
            :fullScreen="true"
            @close="index = null"
            :slideshow="true"
            :enableWheelEvent="false"
            thumbsPosition="bottom"
          >
          </CoolLightBox>

          <div class="images-wrapper">
            <!-- <v-img
              :src="`https://picsum.photos/500/300?image=${n * 1 + 10}`"
              :lazy-src="`https://picsum.photos/500/300?image=${n * 1 + 10}`"
              aspect-ratio="1"
              class="grey lighten-2 image"
              @click="index = n"
            >
              <div class="overlay">
                <div class="text">{{ photos[n].title }}</div>
                <br />
                <div class="text2">{{ photos[n].description }}</div>
              </div>
              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular
                    indeterminate
                    color="grey lighten-5"
                  ></v-progress-circular>
                </v-row>
              </template>
            </v-img> -->
            <v-img
              :src="photo.src"
              :lazy-src="photo.src"
              aspect-ratio="1"
              class="grey lighten-2 image"
              @click="index = n"
            >
              <div class="d-none d-sm-flex overlay">
                <div class="text">{{ photo.title }}</div>
                <br />
                <div class="text2">{{ photo.description }}</div>
              </div>

              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular
                    indeterminate
                    color="grey lighten-5"
                  ></v-progress-circular>
                </v-row>
              </template>
            </v-img>
            <!-- cation -->
            <v-btn
              style="
                position: absolute;
                left: 0px;
                bottom: -20px;
                border-radius: 15px;
              "
              class="d-lg-none d-md-none"
              small
              :light="!switch1"
              :dark="switch1"
              @mouseenter.prevent="
                () => {
                  (touching.value = true), (touching.text = photo.description);
                }
              "
              @mouseleave.prevent="touching.value = false"
              @touchstart.prevent="
                () => {
                  (touching.value = true), (touching.text = photo.description);
                }
              "
              @touchend.prevent="touching.value = false"
            >
              <v-icon>mdi-text-shadow</v-icon>
              <span class="d-none d-sm-inline">Caption</span>
            </v-btn>
            <v-snackbar centered v-model="touching.value">
              {{ touching.text }}
            </v-snackbar>

            <!-- cation -->
            <v-dialog
              v-model="dialog[n]"
              width="600px"
              :retain-focus="false"
              v-if="!select"
            >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  style="bottom: -20px"
                  class="justify-center comment-btn"
                  :color="switch1 ? color.color1 : color.color1"
                  dark
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-badge
                    :content="photo.comments.length"
                    :value="photo.comments.length"
                    :color="switch1 ? color.color3 : 'pink lighten-1'"
                    :dark="switch1"
                    overlap
                  >
                    <v-icon>mdi-comment-text</v-icon>
                    <span class="d-none d-sm-inline">comment</span>
                  </v-badge>
                </v-btn>
              </template>
              <v-card>
                <v-card-title
                  :style="{ backgroundColor: switch1 ? 'white' : color.color1 }"
                >
                  <v-row>
                    <v-col cols="10">
                      <span
                        class="text-h5"
                        style="
                          word-break: break-word;
                          font-family:'Pushster', cursive !important;
                        "
                        :style="{ color: switch1 ? '' : color.color5 }"
                      >
                        Tell Me What you feel in that's photo {{ n }}
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
                        @click="closeDialog(n)"
                      >
                        x
                      </v-btn>
                    </v-col>
                  </v-row>
                </v-card-title>
                <!-- <v-img
                  :src="`https://picsum.photos/500/300?image=${n * 1 + 10}`"
                  :lazy-src="``"
                  aspect-ratio="2"
                  class="grey lighten-2 image"
                  @click="index = n"
                  v-if="!select"
                ></v-img> -->
                <v-img
                  :src="photo.src"
                  :lazy-src="photo.src"
                  aspect-ratio="1.25"
                  class="grey lighten-2 image"
                  @click="index = n"
                  v-if="!select"
                ></v-img>

                <v-form
                  id="form"
                  ref="form1"
                  v-model="valid"
                  lazy-validation
                  @submit.prevent="submitComment(n, $event)"
                  style="
                    background-color: #f1f1f1;
                    padding: 10px;
                    border-radius: 25px;
                  "
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
                    :style="{ color: switch1 ? '#f1f1f1' : color.color5 }"
                    @click.prevent="submitComment(n, $event)"
                  >
                    <i class="fa fa-paper-plane"></i> Send &nbsp;
                  </button>
                </v-form>

                <v-card
                  width="100%"
                  height="100%"
                  class="overflow-auto"
                  v-if="photo.comments.length == 0"
                >
                  <v-card-text
                    :style="{
                      backgroundColor: switch1 ? 'white' : color.color1,
                    }"
                  >
                    <h3
                      class="font-weight-black font-italic"
                      :style="{ color: switch1 ? '' : color.color5 }"
                    >
                      Be The First One To Comment
                    </h3>
                  </v-card-text>
                </v-card>

                <!-- <v-divider class="mt-0"></v-divider> -->
                <v-card
                  v-if="photo.comments.length !== 0"
                  :light="switch1"
                  :dark="!switch1"
                >
                  <v-card-text>
                    <div class="font-weight-bold ml-8 mb-2">
                      Other Comments
                      <v-divider class="mt-2"></v-divider>
                    </div>

                    <v-timeline align-top dense>
                      <v-timeline-item
                        v-for="(comment, p) in photo.comments"
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
                            <!-- @{{
                            message.time
                          }} -->
                          </div>
                          <div
                            class="font-weight-normal text-left commentContent"
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
                                <v-card style="border-radius: 25px">
                                  <v-btn
                                    depressed
                                    color="error"
                                    style="
                                      min-width: 20px;
                                      position: absolute;
                                      top: 0px;
                                      right: 0px;
                                    "
                                    @click="closeEditBtn(comment.id, n, p)"
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
                                      :style="{
                                        color: switch1
                                          ? '#f1f1f1'
                                          : color.color5,
                                      }"
                                      @click.prevent="editComment(n, p)"
                                    >
                                      <i class="fa fa-paper-plane"></i> Send
                                      &nbsp;
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
                                    @click="deleteComment(n, com)"
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
          </div>
        </v-col>
      </v-row>

      <v-row class="d-flex justify-center mb-10">
        <v-col cols="10">
          <div class="images-wrapper">
            <v-img
              :src="selectedPhoto[0].src"
              :lazy-src="selectedPhoto[0].src"
              aspect-ratio="1"
              class="grey lighten-2 image"
              @click="index2 = selectedPhoto"
              v-if="select"
            >
              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular indeterminate color="grey lighten-5">
                  </v-progress-circular>
                </v-row>
              </template>
            </v-img>

            <!-- comment on selected photo -->
            <v-dialog
              class="dialog"
              v-model="dialog[ii]"
              width="600px"
              :retain-focus="false"
              v-if="select"
            >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  class="justify-center comment-btn"
                  :color="switch1 ? color.color1 : color.color1"
                  dark
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-badge
                    :content="photos[ii].comments.length"
                    :value="photos[ii].comments.length"
                    :color="switch1 ? color.color3 : 'pink lighten-1'"
                    overlap
                  >
                    <v-icon>mdi-comment-text</v-icon>
                    <span class="d-none d-sm-inline">comments...</span>
                  </v-badge>
                </v-btn>
              </template>
              <v-card>
                <v-card-title
                  :style="{ backgroundColor: switch1 ? 'white' : color.color1 }"
                >
                  <v-row>
                    <v-col cols="10">
                      <span
                        class="text-h5"
                        style="
                          font-family:Pushster , cursive !important;
                          word-break: break-word;
                        "
                        :style="{ color: switch1 ? '' : color.color5 }"
                      >
                        Tell Me What you feel in
                        {{ selectedPhoto[0].title }} 
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

                <v-img
                  style="background-color: #212121"
                  ref="mycarousel"
                  width="100%"
                  height="400"
                  aspect-ratio="1.25"
                  controls
                  :src="selectedPhoto[0].src"
                />

                <v-form
                  ref="form1"
                  v-model="valid"
                  lazy-validation
                  id="form"
                  @submit.prevent="submitComment(ii, $event)"
                  style="
                    background-color: #e1e1e1;
                    padding: 10px;
                    border-radius: 25px;
                  "
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
                    :disabled="name == '' || message == '' || valid == false"
                    type="submit"
                    class="reply--button"
                    :style="{ color: switch1 ? '#f1f1f1' : color.color5 }"
                    @click.prevent="submitComment(ii, $event)"
                  >
                    <i class="fa fa-paper-plane"></i> Send &nbsp;
                  </button>
                </v-form>

                <v-card
                  width="100%"
                  height="100%"
                  class="overflow-auto"
                  v-if="selectedPhoto[0].comments.length == 0"
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

                <!-- <v-divider class="mt-5"></v-divider> -->
                <v-card
                  v-if="photos[ii].comments.length !== 0"
                  :light="switch1"
                  :dark="!switch1"
                >
                  <v-card-text>
                    <div class="font-weight-bold ml-8 mb-2">
                      Other Comments
                      <v-divider class="mt-2"></v-divider>
                    </div>

                    <v-timeline align-top dense>
                      <v-timeline-item
                        v-for="(comment, p) in photos[ii].comments"
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
                            class="font-weight-normal text-left commentContent"
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
                              style="position: absolute; right: 5px"
                            >
                              <v-dialog
                                v-model="commentDialog[comment.id]"
                                width="600px"
                                :retain-focus="false"
                                v-if="select"
                                dark
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
                                    @click="commentDialog[comment.id] = false"
                                  >
                                    x
                                  </v-btn>
                                  <v-form id="form" v-model="valid">
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
                                      :style="{
                                        color: switch1
                                          ? '#f1f1f1'
                                          : color.color5,
                                      }"
                                      @click.prevent="editComment(ii, p)"
                                    >
                                      <i class="fa fa-paper-plane"></i> Send
                                      &nbsp;
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
                                    @click.prevent="deleteComment(n, com)"
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
          </div>
          <v-snackbar v-model="snackbar" :timeout="2000">
            {{ resp }}
            <template v-slot:action="{ attrs }">
              <v-btn color="blue" text v-bind="attrs" @click="snackbar = false">
                Close
              </v-btn>
            </template>
          </v-snackbar>
        </v-col>
      </v-row>
    </v-container>
    <Message />
    <!-- {{photos}} -->
  </v-app>
</template>

<script>
import ButtonsSocial from "../components/ButtonsSocial.vue";
import Message from "../components/message";
import "vue-cool-lightbox/dist/vue-cool-lightbox.min.css";
import IG from "./IG.js";
import CoolLightBox from "vue-cool-lightbox";

export default {
  name: "photos",
  data: () => ({
    valid: true,
    dialog: {},
    index: null,
    index2: null,
    photos: [
      {
        title: `Photo number 0`,
        description: `Photo number 0 description`,
        src: ``,
        number: 0,
        comments: [],
      },
    ],
    rules: [
      (value) => !!value || "Required.",
      (value) => (value && value.length >= 3) || "Min 3 characters",
    ],
    commentBtn: "comment",

    // search
    loading: false,
    items: [],
    search: null,
    select: null,
    states: [],
    selectedPhoto: [
      {
        title: `Photo number 0`,
        description: `Photo number 0 description`,
        src: `https://picsum.photos/500/300?image=0`,
        number: 0,
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

    // photoNumber1: "",
    ii: 1,
    resp: "",
    snackbar: false,
    snackbarDelete: false,
    vertical: true,
    // touching
    touching: {
      value: false,
    },
    switch1: false,
  }),
  components: {
    ButtonsSocial,
    CoolLightBox,
    Message,
  },
  created() {
    // IG
    IG((response) => {
      this.photos = response;
      // this.photos =[];
      for (let n = 0; n < response.length; n++) {
        this.photos[n] = Object.assign({
          title: `Photo ${response[n].position + 1}`,
          description: response[n].description,
          src: response[n].src,
          number: response[n].position,
          comments: response[n].comments,
          // JSON.parse(localStorage.getItem(`PhotoCommentsOf${n}`)) || [],
        });

        this.states[n] = this.photos[n].title;
        if (
          window.localStorage.getItem(`PhotoCommentsOf${n}`) !== null &&
          this.photos[n].comments
        ) {
          var x = 0;
          for (let i = 0; i < this.photos[n].comments.length; i++) {
            if (
              JSON.parse(localStorage.getItem(`PhotoCommentsOf${n}`))[x] &&
              this.photos[n].comments[i].id ==
                JSON.parse(localStorage.getItem(`PhotoCommentsOf${n}`))[x].id
            ) {
              this.photos[n].comments[i].author = JSON.parse(
                localStorage.getItem(`PhotoCommentsOf${n}`)
              )[x].author;
              this.photos[n].comments[i].color = JSON.parse(
                localStorage.getItem(`PhotoCommentsOf${n}`)
              )[x].author
                ? "pink"
                : this.photos[n].comments[i].color;
              x++;
            }
          }
        }
      }
    });

    // for (let n = 0; n < 16; n++) {
    //   this.photos[n] = {
    //     title: `Photo number ${n}`,
    //     description: `Photo number ${n} description`,
    //     src: `https://picsum.photos/500/300?image=${n * 1 + 10}`,
    //     number: n,
    //     comments: JSON.parse(localStorage.getItem(`commentsOf${n}`)) || [],
    //   };
    //   this.states[n] = this.photos[n].title;
    // }
    this.colorDark();
  },
  mounted() {},
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
    submitComment(n) {
      this.photos[n].comments.push({
        // id: newComment.id,
        name: this.name,
        message: this.message,
        Number: n,
        color: "red",
        author: true,
      });
      //api
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/addPhotoComment`;
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
          this.snackbar = true;

          var newComment = Data.data;
          // console.log(newComment);
          this.photos[n].comments[this.photos[n].comments.length - 1] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: "red",
            author: true,
          };

          var authorCommnets = this.photos[n].comments.filter((e) => {
            return e.author == true;
          });
          localStorage.setItem(
            `PhotoCommentsOf${n}`,
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
    },

    editComment(n, p) {
      // console.log(
      //   "id " + this.photos[n].comments[p].id + " n " + n + " p " + p
      // );
      this.photos[n].comments[p] = {
        id: this.photos[n].comments[p].id,
        name: this.Editname,
        message: this.Editmessage,
        Number: n,
        color: this.photos[n].comments[p].color,
        author: true,
      };
      //api
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/editPhotoComment/${this.photos[n].comments[p].id}`;
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
          this.snackbar = true;

          var newComment = Data.data;
          this.photos[n].comments[p] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: this.photos[n].comments[p].color,
            author: true,
          };
          // console.log(this.photos[n].comments[p]);
          var authorCommnets = this.photos[n].comments.filter((e) => {
            return e.author == true;
          });

          localStorage.setItem(
            `PhotoCommentsOf${n}`,
            JSON.stringify(authorCommnets)
          );
        });
      // console.log(this.photos[n].comments[p]);
      this.Editname = "";
      this.Editmessage = "";

      this.commentDialog[this.photos[n].comments[p].id] = false;
      // this.dialog[n] = false;
      //  this.$router.go(0);
    },
    deleteComment(n, p) {
      // console.log(
      //   "id " + this.photos[n].comments[p].id + " n " + n + " p " + p
      // );
      // this.photos[n].comments.shift(p);

      // api
      const axios = require("axios");
      let base_url = `http://192.168.1.10/music%20project/music%20project/public/api/comments/deletePhotoComment/${this.photos[n].comments[p].id}`;
      axios.post(base_url).then((response) => {
        this.resp = response.data.Success;
        this.snackbar = true;
        // console.log(Data);
        var authorCommnets = this.photos[n].comments.filter((e) => {
          return e.author == true;
        });

        localStorage.setItem(
          `PhotoCommentsOf${n}`,
          JSON.stringify(authorCommnets)
        );
      });

      this.photos[n].comments.splice(p, 1);
      this.snackbarDelete = false;
    },
    closeEditBtn(id) {
      this.commentDialog[id] = false;
    },
    closeDialog(n) {
      console.log(this.$refs.form1);
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
        this.selectedPhoto = this.photos.filter((e, index) => {
          if (e.title == this.select) {
            this.ii = index;
          }
          return e.title == this.select;
        });
        // console.log(this.selectedPhoto);
      }
    },
    color() {
      this.switch1 = this.$store.state.switch;
    },
  },
};
</script>

<style>
</style>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?&family=Kaushan+Script&family=Lobster&family=Pushster");

#inspire2 {
  min-height: 100%;
  background: url("../assets/img/m8.jpg") rgba(0, 0, 0, 0.5);
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
.overlay {
  display: flex;
  justify-content: center;
  position: absolute;
  top: 250px;
  bottom: 0px;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: 0.5s ease;
  background-color: black;
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
.text {
  color: white;
  font-size: 1.25rem;
  font-weight: bolder;
  // font-style: italic;
  position: absolute;
  text-align: center;
  font-family: "Kaushan Script", cursive;
}
.text2 {
  color: white;
  font-size: 1.25rem;
  position: absolute;
  top: 10%;
  text-align: center;
  font-family: "Lobster", cursive;
}
// button
.reply--button {
  position: static;
  right: -100px;
  border: 1px solid #e1e1e1;
  background-color: #2a619ca9;
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
  border: 1px solid #2a629c;
  background-color: #2a629c;
}
.reply--button:focus,
.reply--button:active {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  border: 1px solid #2a629c;
}
.reply--button:disabled {
  color: #1f1f1f;
  background-color: transparent;
}
.commentContent {
  // background-color: #f1f1f1;
  padding: 10px;
  border-radius: 15px;
}
.commentContent > * {
  margin: 10px 0px;
  border-radius: 25px;
}
.comment-btn {
  position: absolute;
  bottom: -5px;
  right: 0px;
  font-size: 0.5rem;
  width: fit-content;
  padding: 10px !important;
  border-radius: 15px;
  height: 30px !important;
  min-width: 20px !important;
}
@media screen and (max-width: 768px) {
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
}

// scrollbar
/* width */
::-webkit-scrollbar {
  height: 15px;
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
</style>