<template>
  <v-toolbar dark :color="toolbarColor" style="border-radius: 25px">
  <v-toolbar-title>{{toolbarTitle}}</v-toolbar-title>
    <v-autocomplete
      v-model="select"
      :loading="SearchLoading"
      :items="items"
      :search-input.sync="search"
      cache-items
      class="mx-4"
      flat

      :light = "light"
      :color="inputColor" 
      :item-color="itemColor" 
      
      dense
      :full-width="true"
      :solo="true"
      :disable-lookup="false"
      hide-no-data
      hide-details
      solo-inverted
      label="Search..."
      prepend-inner-icon="mdi-magnify"
    ></v-autocomplete>
    <v-btn icon @click="reset()">
      <v-icon color="black">mdi-trash-can</v-icon>
    </v-btn>
    <div class="text-danger">
      <!-- {{ select }} -->
    </div>
  </v-toolbar>
</template>

<script>
export default {
  name: "search",
  props: ['data', 'states' , 'toolbarColor' , 'inputColor' , 'itemColor' , 'light' , 'toolbarTitle'],
  data: (self) => ({
    items: [],
    search: null,
    select: null,
    SearchLoading: false,
    tracksse: self,
  }),
  mounted() {
    // console.log({
    // select: this.select,
     // console.log(this.tracksse);
    // });
  },
  methods: {
    querySelections(v) {
      this.SearchLoading = true;
      // Simulated ajax query
      setTimeout(() => {
        this.items = this.states.filter((e) => {
          return (e || "").toLowerCase().indexOf((v || "").toLowerCase()) > -1;
        });
        this.SearchLoading = false;
      }, 500);
    },
    reset(){
      this.select = null;
      this.$emit("reset", this.select );
    }
  },
  watch: {
    search(val) {
      val && val !== this.select && this.querySelections(val);
      if (this.select) {
        // this.currentTrack[0] = this.tracks.filter((e, index) => {
          this.data.forEach((e, index,) => {
          if (e.title == this.select) {
            // this.playlist(index);
            this.$emit("selectionAdded", index, this.select);
            // console.log(this.select, index);
          }
          // return e.title == this.select;
        });
        // console.log(this.currentTrack);
      }
    },
  },
};
</script>