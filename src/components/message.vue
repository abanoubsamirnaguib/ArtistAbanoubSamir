<template>
  <v-card id="create">
    <v-speed-dial
      v-model="fab"
      :top="top"
      :bottom="bottom"
      :right="right"
      :left="left"
      :direction="direction"
      :open-on-hover="$vuetify.breakpoint.lgAndUp"
      :transition="transition"
    >
      <template v-slot:activator>
        <v-btn v-model="fab" color="red darken-2" dark fab>
          <v-icon v-if="fab"> mdi-close </v-icon>
          <v-icon v-else> mdi-forum </v-icon>
        </v-btn>
      </template>
      <v-btn
        fab
        dark
        small
        color="blue"
        link
        target="_blank"
        href="https://www.messenger.com/t/726626495"
      >
        <v-icon>mdi-facebook-messenger</v-icon>
      </v-btn>
      <v-btn
        fab
        dark
        small
        color="green"
        link
        target="_blank"
        href="https://wa.me/201068644570?text=WebSiteCustomer:"
      >
        <v-icon>mdi-whatsapp</v-icon>
      </v-btn>
      <v-btn
        fab
        dark
        small
        color="blue"
        link
        target="_blank"
        href="https://t.me/abanoubsamirnaguib"
        style="transform: rotate(-35deg)"
      >
        <v-icon>mdi-send</v-icon>
      </v-btn>
    </v-speed-dial>
  </v-card>
</template>

<script>
export default {
  name: "Message",
  data: () => ({
    direction: "top",
    fab: false,
    fling: false,
    tabs: null,
    top: false,
    right: true,
    bottom: true,
    left: false,
    transition: "slide-y-reverse-transition",
  }),
};
</script>

<style lang="scss" scoped>
#create{
    position: fixed;
    bottom: 10px;
    right:10px;
    z-index: 1000;
}
/* This is for documentation purposes and will not be needed in your application */
#create .v-speed-dial {
  position: absolute;
}

#create .v-btn--floating {
  position: relative;
}
</style>