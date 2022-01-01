<template>
  <v-app id="inspire1">

    <v-container class="">
      <v-row style="height: 200px">
        <v-col>
          <h3 class="white--text" style="font-family: 'Caveat', cursive; font-size:20px;" > Follow Me In </h3>
          <ButtonsSocial />
        </v-col>
      </v-row>
      <v-row style="height: auto">
        <v-col class="name">
          <!-- <h1 class="white--text">Abanoub Samir</h1> -->
          <!-- <h2 class="white--text">professional music producer</h2> -->
          <vue-typed-js
            v-if="show1"
            style =  'color : white'
            :strings="[' Abanoub Samir ']"
            :loop="loop1"
            @onComplete="doSmth1()"
            :typeSpeed="100"
            :startDelay="1000"
            :showCursor="false"
            :fadeOut="true"
          >
            <h1>I am <span class="typing"></span></h1>
          </vue-typed-js>
          <vue-typed-js
            v-if="show2"
            style= 'color : white'
            :strings="['professional music producer']"
            :loop="loop2"
            @onComplete="doSmth2()"
          >
            <h2><span class="typing"></span></h2>
          </vue-typed-js>
        </v-col>
      </v-row>
      <v-row style="height: 150px">
        <v-col class="qout">
          <v-fade-transition  mode="in-out" >
            <p
              v-if="show4"
              class="white--text "
              origin="center center"
            >
              Music only makes me stronger', 'Music speaks to the heart in ways
              that words cannot express.
            </p>
          </v-fade-transition>
          <!-- d-none d-sm-flex -->
          <vue-typed-js
            class="white--text "
            v-if="show3"
            :strings="[
              'Music only makes me stronger',
              'Music speaks to the heart in ways that words cannot express.....',
            ]"
            :loop="false"
            :cursorChar="'_'"
            :typeSpeed="50"
            @onComplete="doSmth3()"
            :fadeOut="true"
            :fadeOutDelay="500"
            :autoInsertCss="true"
          >
            <h3><span class="typing"></span></h3>
          </vue-typed-js>
        </v-col>
      </v-row>
    </v-container>
        <Message/>
  </v-app>
</template>

<script>
import ButtonsSocial from "../components/ButtonsSocial.vue";
import Message from "../components/message"


export default {
  name: "Home2",
  data: () => ({
    show1: true,
    show2: false,
    show3: false,
    show4: false,
    loop1: false,
    loop2: false,
    //color
}),

  components: {
    ButtonsSocial,
    Message
  },
  methods: {
    doSmth1() {
      this.show2 = true;
      // this.loop2=true;
    },
    doSmth2() {
      this.show1 = true;
      this.show3 = true;
      // this.loop2=false;
    },
    doSmth3() {
      this.show3 = false;
      this.show4 = true;
      // this.loop2=false;
    },
  },
  computed:{
        color () {
      return this.$store.state.color
    }

  },
  
  beforeCreate(){
    document.body.style.zoom = "100%";
  }
};
</script>
<style>
/* @import url('https://fonts.googleapis.com/css2?family=Pushster&display=swap'); */
</style>

<style scoped lang="scss">
@import url("https://fonts.googleapis.com/css2?&family=Kaushan+Script&&family=Comforter+Brush&family=Caveat:wght@700&display=swap");
#inspire1 {
  background-image: url("../assets/img/homebg.jpg");
  background-attachment: fixed;
  background-size: cover;
  background-position: center center;
}
h1:first-of-type {
  font-size: 56px;
  font-family: "Comforter Brush", cursive;
}
h2:first-of-type {
  font-size: 36px;
  font-family: "Kaushan Script", cursive;
}

.name {
  display: flex;
  justify-content: flex-start;
  flex-direction: column;
  align-content: center;
  align-items: flex-start;
  padding: 0px 100px;
}
.qout {
  display: flex;
  justify-content: center;
  flex-direction: row;
  align-content: center;
  align-items: center;
  padding: 0px 100px;
  word-wrap: break-word;
  p {
    max-width: 50%;
    font-size: 23px;
    font-family: "Caveat", cursive;
    font-weight: bolder;
    color: white !important;
    word-spacing: 5px;
    -webkit-text-stroke-width: 0.5px;
    -webkit-text-stroke-color: black;
    background-color: rgba($color: #000000, $alpha: 0.5);
  }
}
@media screen and (max-width: 768px){
  h1:first-of-type {
  font-size: 36px;
  font-family: "Comforter Brush", cursive;
}
h2:first-of-type {
  font-size: 26px;
  font-family: "Kaushan Script", cursive;
}
.qout{
  padding: 0px 0px;
  p{
    max-width: 90%;
    font-size: 25px;
  }
}
}
::selection {
  background: #ff5d5d; /* WebKit/Blink Browsers */
}
</style>>


