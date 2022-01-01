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
        :style="{ backgroundColor: (switch1) ? '#1e1e1e' : color.color1 }"
        style="margin: 15px; border-radius: 15px"
      >
        <v-col cols="0" :lg="6" :sm="12" :md="6" class="order-sm-last">
          <!-- #385F70 -->
          <v-card class="pa-3" :color="(switch1) ? color.color3 : color.color1" dark>
            <v-card-title class="MESSAGE d-flex justify-center">
              SEND ME A MESSAGE</v-card-title
            >

            <v-card-subtitle class="left-SubTitle d-flex justify-end"
              >I am Always here ;)</v-card-subtitle
            >

            <validation-observer ref="observer" v-slot="{ invalid }">
              <form @submit.prevent="submit">
                <validation-provider
                  v-slot="{ errors }"
                  name="Name"
                  rules="required|max:25|min:3"
                >
                  <v-text-field
                    v-model="name"
                    :counter="25"
                    :error-messages="errors"
                    label="Name"
                    required
                    minlength
                  ></v-text-field>
                </validation-provider>
                <validation-provider
                  v-slot="{ errors }"
                  name="phoneNumber"
                  :rules="{
                    min: 9,
                    max: 20,
                  }"
                >
                  <v-text-field
                    v-model="phoneNumber"
                    :counter="7"
                    :error-messages="errors"
                    label="Phone Number"
                    required
                  ></v-text-field>
                </validation-provider>
                <validation-provider
                  v-slot="{ errors }"
                  name="email"
                  rules="email"
                >
                  <v-text-field
                    v-model="email"
                    :error-messages="errors"
                    label="E-mail"
                    required
                  ></v-text-field>
                </validation-provider>
                <validation-provider
                  v-slot="{ errors }"
                  name="Message"
                  rules="required|min:10|max:500"
                >
                  <v-textarea
                    v-model="Message"
                    :counter="300"
                    :error-messages="errors"
                    label="Type Your Message"
                    required
                    minlength
                  ></v-textarea>
                </validation-provider>

                <v-btn class="mr-4" type="submit" :disabled="invalid">
                  Send
                </v-btn>
                <v-btn @click="clear"> clear </v-btn>
              </form>
            </validation-observer>
            <!-- message from api -->
            <v-alert
              v-model="alert"
              dismissible
              color="green"
              type="success"
              v-if="sucsess"
            >
              <vue-typed-js
                :strings="[sucsess]"
                :loop="loop"
                :typeSpeed="100"
                :startDelay="1"
                :showCursor="true"
                :fadeOut="true"
              >
                <strong><span class="typing"></span></strong>
              </vue-typed-js>
            </v-alert>
            <v-alert dismissible color="error" type="error" v-if="error.Name">{{
              error.Name[0]
            }}</v-alert>
            <v-alert
              dismissible
              color="error"
              type="error"
              v-if="error.phoneNumber"
              >{{ error.phoneNumber[0] }}</v-alert
            >
            <v-alert
              dismissible
              color="error"
              type="error"
              v-if="error.email"
              >{{ error.email[0] }}</v-alert
            >
            <v-alert
              dismissible
              color="error"
              type="error"
              v-if="error.Message"
              >{{ error.Message[0] }}</v-alert
            >
          </v-card>

          <v-divider color="#F8BBD0" class="mt-5 d-flex d-sm-none"></v-divider>
        </v-col>

        <v-col cols="0" :sm="12" :lg="6" :md="6" class="">
          <!-- #385F70 -->
          <v-divider
            :color="(switch1) ? color.color1 :'#dd4377'"
            class="mt-5 d-none d-lg-flex"
            vertical
            style="
              position: absolute;
              left: 50%;
              max-width: 5px;
              width: 1.5px;
              min-height: 520px !important;
            "
            v-bind:style="divider"
          ></v-divider>
          <v-card ref="card" class="pa-3" :color="(switch1) ? color.color3 : color.color1" dark height="fit-content">
            <!-- <br/>  -->

            <v-row justify="center">
              <v-card-title class="Biography" style="font-size: 2rem !important"
                >What I can do for you...
              </v-card-title>
              <v-expansion-panels popout v-model="panel">
                <v-expansion-panel
                  @click="showpanel = true"
                  active-class="active"
                  class="panel"
                  hover
                  v-for="(serve, i) in services"
                  :key="i"
                >
                  <v-expansion-panel-header class="servesName">
                    {{ serve.name }}
                  </v-expansion-panel-header>
                  <v-expansion-panel-content>
                    <vue-typed-js
                      class="servesDis"
                      v-if="showpanel"
                      :strings="[serve.CanDo]"
                      :loop="false"
                    >
                      <h2><span class="typing"></span></h2>
                    </vue-typed-js>
                  </v-expansion-panel-content>
                </v-expansion-panel>
              </v-expansion-panels>
            </v-row>

            <br />
            <v-card-title class="Biography">Let's talk... </v-card-title>
            <vue-typed-js
              v-if="show1"
              class="text-left left-SubTitle"
              :strings="[
                'Please Be Free To Contact Me Anytime, You Can Contact Me By Email Or Phone , I Am Always Here And Ready For Helping You ',
              ]"
              :loop="loop"
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
              :strings="['Al Haram, Giza']"
              :loop="loop"
              @onComplete="doSmth2()"
              :typeSpeed="1"
              :startDelay="1000"
              :showCursor="true"
              :fadeOut="false"
            >
              <p>
                <strong class="left-title">Address </strong
                ><span class="typing"></span>
              </p>
            </vue-typed-js>

            <vue-typed-js
              v-if="show3"
              :strings="['020-1221966084 / 020-1068644570']"
              :loop="loop"
              @onComplete="doSmth3()"
              :typeSpeed="100"
              :startDelay="1000"
              :showCursor="true"
              :fadeOut="true"
            >
              <p>
                <strong class="left-title">Phone </strong>
                <span class="typing"></span>
              </p>
            </vue-typed-js>

            <vue-typed-js
              v-if="show4"
              :strings="['AbanoubSamir@gamil.com']"
              :loop="loop"
              @onComplete="doSmth4()"
              :typeSpeed="100"
              :startDelay="1000"
              :showCursor="true"
              :fadeOut="true"
            >
              <p>
                <strong class="left-title"> Email </strong>
                <span class="typing"></span>
              </p>
            </vue-typed-js>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <Message />
  </v-app>
</template>

<script>
import ButtonsSocial from "../components/ButtonsSocial.vue";
import Message from "../components/message";

import {
  required,
  digits,
  email,
  max,
  regex,
  min,
} from "vee-validate/dist/rules";
import {
  extend,
  ValidationObserver,
  ValidationProvider,
  setInteractionMode,
} from "vee-validate";

setInteractionMode("eager");

extend("digits", {
  ...digits,
  message: "{_field_} needs to be {length} digits. ({_value_})",
});

extend("required", {
  ...required,
  message: "{_field_} can not be empty",
});

extend("max", {
  ...max,
  message: "{_field_} may not be greater than {length} characters",
});
extend("min", {
  ...min,
  message: "{_field_} may not be less than {length} characters",
});

extend("regex", {
  ...regex,
  message: "{_field_} {_value_} does not match {regex}",
});

extend("email", {
  ...email,
  message: "Email must be valid",
});

export default {
  name: "ContactMe",
  data: () => ({
    show1: true,
    show2: false,
    show3: false,
    show4: false,
    loop: false,
    showpanel: false,
    panel: [],
    divider: {},

    //more
    name: "",
    phoneNumber: "",
    email: "",
    Message: "",

    sucsess: "",
    error: "",
    alert: true,
    // services
    services: [
      {
        name: "As a Singer ",
        CanDo:
          "As a singer, you can get the best music for your songs and the highest possible quality. I can also provide live playback for your songs with the best skilled and professional musicians. Whatever your song is, whether cover or original, I can produce it for you and mix and master it with the best quality. I can also put professional effects on  Your voice and the suitable mix for it and of course we can modify anything together until you reach the closest track  of your imagination.",
      },
      {
        name: "As a Musicion ",
        CanDo:
          "As a musician who works to produce your music, I can do a lot for you. I can arrange a whole track for you to play your musical instrument on it , or I can add any instrument you want besides your wonderful playing,, I can also mix and master your track of music and I can also record any instrument live , as You want it with the best skilled musicians who are professional on that.",
      },
      {
        name: "AS a Producer",
        CanDo:
          "As a music producer, I am a professional sound engineer. I worked in many studios, so I can do the audio engineering for your music tracks, and I can also do the final master for you,, also if you lack some instruments and want to record them through me, then I have many Professional musicians who are skilled in recording and playing with the best  recording tools and various recording programs. I can also give you the project in the end and help you with your music track.",
      },
      {
        name: "AS a Video Maker..etc ",
        CanDo:
          "As a video producer, I can make beautiful music that suits your videos and according to the type of music you need, so I can make most different types of music with the best quality and clarity, and of course it will be the property rights to use it in your channel. also , you can use it in any video you want from your production.<br/> If you are one of Voice Over, then I can make music that matches the mood of the clip you are presenting. I can also create an audio engineering suitable for your voice to match the music and with the appropriate audio standards for Voice Over to come out with the best possible quality and best performance. ",
      },
    ],
    //dark mode
    switch1: false,
  }),
  created() {
    //api
    this.colorDark();
  },
  methods: {
    doSmth1() {
      this.show2 = true;
      // this.loop2=true;
      this.matchHeight();
    },
    doSmth2() {
      this.show3 = true;
      this.matchHeight();
    },
    doSmth3() {
      this.show4 = true;
      this.matchHeight();
    },
    doSmth4() {
      this.show4 = true;
    },
    ChangePanel() {
      console.log(this.panel);
    },
    submit() {
      this.$refs.observer.validate();

      var axios = require("axios");
      var config = {
        method: "post",
        url: "http://localhost/music%20project/music%20project/public/api/ContactMe",
        data: {
          Name: this.name,
          phoneNumber: this.phoneNumber,
          email: this.email,
          Message: this.Message,
        },
        headers: {},
      };

      var vm = this;
      axios(config)
        .then(function (response) {
          // console.log(response.data);
          if (response.data.Sucsess) {
            vm.sucsess = response.data.Sucsess;
            console.log(vm.sucsess);
            vm.clear();
            vm.alert = true;
          } else if (response.data.error) {
            vm.error = response.data.error;
            console.log(vm.error);
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    clear() {
      this.name = "";
      this.phoneNumber = "";
      this.email = "";
      this.Message = "";
      this.$refs.observer.reset();
    },
    matchHeight() {
      var heightString = this.$refs.card.$el.clientHeight + "px";
      this.divider = { height: heightString };
      // console.log(heightString);
    },
    colorDark() {
      this.switch1 =this.$store.state.switch;
      if (this.switch1 == true) {
        this.$store.commit("color");
      }
      if (this.switch1 == false) {
        this.$store.commit("dark");
      }
    }
  },
  components: {
    ButtonsSocial,
    Message,
    ValidationProvider,
    ValidationObserver,
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
  background: url("../assets/img/ContactMe.jpg") rgba(0, 0, 0, 0.5);
  background-size: cover;
  background-blend-mode: multiply;
  background-origin: bottom right;
  background-attachment: fixed;
  background-position: bottom center;
}
.left-title {
  font-size: 20px !important;
  padding-right: 10px;
  font-family: "Comforter Brush", cursive !important;
}
.left-SubTitle {
  font-size: 20px;
  font-family: "Caveat", cursive !important;
}

.Biography {
  word-break: break-word;
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
.MESSAGE {
  font-weight: 400;
  font-size: 1.5rem !important;
  word-break: break-word;
  font-family: "Kaushan Script", cursive;
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
.servesName {
  font-weight: bolder;
  font-size: 1.5rem !important;
  font-family: "Kaushan Script", cursive;
  background-color: #424242;
}
.servesDis {
  font-weight: bolder;
  font-style: italic;
  font-size: 0.75rem !important;
  font-family: "Roboto", sans-serif;
  text-align: left;
  padding: 5px 0px;
  color: rgb(205, 205, 205);
}
.panel {
  background-color: #424242c3 !important;
}
@media screen and (max-width: 768px) {
  .Biography {
    font-size: 2rem !important;
  }

  .order-sm-last {
    order: -1;
  }
  .servesName {
    font-size: 1.25rem !important;
  }
  .servesDis {
    font-size: 0.75rem !important;
  }
}
</style>