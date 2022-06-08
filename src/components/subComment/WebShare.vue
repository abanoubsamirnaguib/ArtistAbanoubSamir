<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="fit-content">
      <v-card>
        <v-card-title class="text-h5 text-break text-left">
          Share Music Track On Your Favourte Platforms
        </v-card-title>
        <v-card-text class="text-capitalize text-center"
          >Share {{ Title }} On Your Favourte Platforms
        </v-card-text>

        <v-card-actions class="white justify-center">
          <!-- copy button -->
          <v-tooltip bottom color="primary">
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                color="gray"
                class="white--text"
                fab
                x-large
                @click="copy()"
                v-bind="attrs"
                v-on="on"
              >
                <v-icon color="black">mdi-content-copy</v-icon>
              </v-btn>
            </template>
            <span>Copy To Clipboard </span>
          </v-tooltip>
          <!-- copy button -->

          <div
            v-for="(social, i) in socials"
            :key="i"
          >
            <v-tooltip bottom :color="social.color">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  v-bind="attrs"
                  v-on="on"
                  fab
                  x-large
                  color="gray"
                  class="white--text"
                >
                  <ShareNetwork
                    :network="social.name"
                    :url="data.url"
                    :title="data.title"
                    :description="data.description"
                    :quote="data.quote"
                    hashtags="Music"
                  >
                    <v-icon :color="social.color">{{ social.icon }}</v-icon>
                  </ShareNetwork>
                </v-btn>
              </template>
              <span>share on {{ social.name }} </span>
            </v-tooltip>
          </div>
        </v-card-actions>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="black darken-1" text @click="closeDialog()">
            Close
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
export default {
  props: ["shareit", "Title", "data"],
  components: {},
  mounted() {},
  data() {
    return {
      dialog: false,
      socials: [
        {
          name: "Email",
          icon: "mdi-email",
          color: "black",
        },
        {
          name: "Facebook",
          icon: "mdi-facebook",
          color: "indigo",
        },
        {
          name: "Messenger",
          icon: "mdi-facebook-messenger",
          color: "light-blue accent-4",
        },
        {
          name: "Telegram",
          icon: "mdi-send",
          color: "light-blue",
        },
        {
          name: "WhatsApp",
          icon: "mdi-whatsapp",
          color: "green darken-2",
        },
        {
          name: "LinkedIn",
          icon: "mdi-linkedin",
          color: "blue darken-1",
        },
        {
          name: "Twitter",
          icon: "mdi-twitter",
          color: "cyan lighten-3",
        },
        {
          name: "instagram",
          icon: "mdi-instagram",
          color: "pink accent-3",
        },
      ],
    };
  },
  methods: {
    closeDialog() {
      this.dialog = false;
      this.$emit("closeDialog", false);
    },
    copy() {
      navigator.clipboard.writeText(this.data.url);
    },
  },
  watch: {
    shareit() {
      this.dialog = this.shareit;
    },
  },
};
</script>