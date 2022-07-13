
const axios = require("axios");

export default {
    namespaced: true,
    state: {
        Tracks: []
    },
    getters: {
        data: state => state.Tracks,
    },
    actions: {
         loadMusic({commit}) {
            return new Promise(( res, rej ) => {
                var base_url =
                  // "http://192.168.1.10/music%20project/music%20project/public/api/Music";
                  "http://asmusicbackend-07251.herokuapp.com/public/api/Music";
                axios
                  .get(base_url)
                  .then((response) => {
                    var Data = response.data.data;
                     commit('GET_Tracks', Data);
                     res(Data);
                })
                .catch((error) => {
                    console.log(error);
                    this.errored = true;
                    rej(error);
                })
            });
            // end promise
          }
    },
    mutations: {
        GET_Tracks(state, Tracks) {
            state.Tracks = Tracks; 
        }
    },

};
