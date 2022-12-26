<template>
  <v-dialog v-model="dialog[index]" width="600px" :retain-focus="false">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        :style="btnPostion"
        :class="type == 'Video' || type == 'Photo' ? 'comment-btn' : ''"
        class="justify-center"
        :color="MainColor"
        dark
        v-bind="attrs"
        v-on="on"
      >
        <v-badge
          :content="data.comments.length"
          :value="data.comments.length"
          :color="badgeColor"
          :dark="switch1"
          overlap
        >
          <v-icon>mdi-comment-text</v-icon>
          <span class="d-none d-sm-inline">Comments...</span>
        </v-badge>
      </v-btn>
    </template>
    <v-card
      :style="{
        backgroundColor:
          type == 'News' ? (switch1 ? 'white' : color.color1) : '',
      }"
    >
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
                font-family: 'Pushster', cursive !important;
              "
              :style="{ color: switch1 ? '' : color.color5 }"
            >
              {{ Maintitle }}
            </span>
          </v-col>
          <v-col cols="2">
            <v-btn
              depressed
              color="error"
              style="min-width: 20px; position: absolute; top: 0px; right: 0px"
              @click="closeDialog(index)"
            >
              x
            </v-btn>
          </v-col>
        </v-row>
      </v-card-title>

      <slot></slot>

      <v-form
        id="form"
        ref="form1"
        v-model="valid"
        lazy-validation
        @submit.prevent="submitComment(index, $event)"
        :style="{ backgroundColor: FormColor }"
        style="padding: 10px; border-radius: 25px"
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
          @click.prevent="submitComment(index, $event)"
        >
          <i class="fa fa-paper-plane"></i> Send &nbsp;
        </button>
      </v-form>

      <v-card
        width="100%"
        height="100%"
        class="overflow-auto"
        v-if="data.comments.length == 0"
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

      <!-- <v-divider class="mt-0"></v-divider> -->
      <v-card
        v-if="data.comments.length !== 0"
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
              v-for="(comment, p) in data.comments"
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
                    backgroundColor: switch1 ? '#f1f1f1' : color.color2,
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
                    <!-- v-if="!select" -->
                    <v-dialog
                      v-model="commentDialog[comment.id]"
                      width="600px"
                      :retain-focus="false"
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
                          @click="closeEditBtn(comment.id, index, p)"
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
                              color: switch1 ? '#f1f1f1' : color.color1,
                            }"
                            @click.prevent="editComment(index, p)"
                          >
                            <i class="fa fa-paper-plane"></i> Send &nbsp;
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
                          @click="deleteComment(index, com)"
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

        <v-snackbar v-model="snackbar" :timeout="2000">
          {{ resp }}
          <template v-slot:action="{ attrs }">
            <v-btn color="blue" text v-bind="attrs" @click="snackbar = false">
              Close
            </v-btn>
          </template>
        </v-snackbar>
      </v-card>
    </v-card>
  </v-dialog>
</template>
<script>
export default {
  name: "commentTemp1",
  props: ["type", "MainColor", "data", "badgeColor", "Maintitle", "index"],
  data: () => ({
    valid: true,
    dialog: {},
    name: "",
    message: "",
    Editname: "",
    Editmessage: "",
    com: "",
    commentDialog: {},

    switch1: false,
    touching: {
      value: false,
    },
    rules: [
      (value) => !!value || "Required.",
      (value) => (value && value.length >= 3) || "Min 3 characters",
    ],

    resp: "",
    snackbar: false,
    snackbarDelete: false,
    vertical: true,
    FormColor: "#f1f1f1",
    btnPostion: "bottom: -20px",
  }),
  mounted() {
    this.changeFormColor();
    // console.log(this.type);
  },
  methods: {
    submitComment(n) {
      this.data.comments.push({
        // id: newComment.id,
        name: this.name,
        message: this.message,
        Number: n,
        color: "red",
        author: true,
      });
      //api
      const axios = require("axios");
      let base_url = 
      // `http://192.168.1.10/music%20project/music%20project/public/api/comments/add${this.type}Comment`;
      `${process.env.VUE_APP_base_url}/comments/add${this.type}Comment`;
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
          this.data.comments[this.data.comments.length - 1] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: "red",
            author: true,
          };

          var authorCommnets = this.data.comments.filter((e) => {
            return e.author == true;
          });
          localStorage.setItem(
            `${this.type}CommentsOf${n}`,
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
      //   "id " + this.data.comments[p].id + " n " + n + " p " + p
      // );
      this.data.comments[p] = {
        id: this.data.comments[p].id,
        name: this.Editname,
        message: this.Editmessage,
        Number: n,
        color: this.data.comments[p].color,
        author: true,
      };
      //api
      const axios = require("axios");
      let base_url = 
      // `http://192.168.1.10/music%20project/music%20project/public/api/comments/edit${this.type}Comment/${this.data.comments[p].id}`;
      `${process.env.VUE_APP_base_url}/comments/edit${this.type}Comment/${this.data.comments[p].id}`;
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
          this.data.comments[p] = {
            id: newComment.id,
            name: newComment.name,
            message: newComment.message,
            Number: n,
            color: this.data.comments[p].color,
            author: true,
          };
          // console.log(this.data.comments[p]);
          var authorCommnets = this.data.comments.filter((e) => {
            return e.author == true;
          });

          localStorage.setItem(
            `${this.type}CommentsOf${n}`,
            JSON.stringify(authorCommnets)
          );
        });
      // console.log(this.data.comments[p]);
      this.Editname = "";
      this.Editmessage = "";

      this.commentDialog[this.data.comments[p].id] = false;
      // this.dialog[n] = false;
      //  this.$router.go(0);
    },
    deleteComment(n, p) {
      // console.log(
      //   "id " + this.data.comments[p].id + " n " + n + " p " + p
      // );
      // this.data.comments.shift(p);

      // api
      const axios = require("axios");
      let base_url = 
      // `http://192.168.1.10/music%20project/music%20project/public/api/comments/delete${this.type}Comment/${this.data.comments[p].id}`;
      `${process.env.VUE_APP_base_url}/comments/delete${this.type}Comment/${this.data.comments[p].id}`;
      axios.post(base_url).then((response) => {
        this.resp = response.data.Success;
        this.snackbar = true;
        // console.log(Data);
        var authorCommnets = this.data.comments.filter((e) => {
          return e.author == true;
        });

        localStorage.setItem(
          `${this.type}CommentsOf${n}`,
          JSON.stringify(authorCommnets)
        );
      });

      this.data.comments.splice(p, 1);
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
    changeFormColor() {
      switch (this.type) {
        case "Photo":
          this.FormColor = "#f1f1f1";
          this.btnPostion = "bottom: -20px";
          break;
        case "Video":
          this.FormColor = "#f1f1f1";
          this.btnPostion = "bottom: 15px";
          break;
        case "News":
          this.FormColor = "pink";
          this.btnPostion = "bottom: 0px";
          break;
        default:
          this.FormColor = "#f1f1f1";
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
@import url("https://fonts.googleapis.com/css2?&family=Kaushan+Script&family=Lobster&family=Pushster");

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
</style>