
const axios = require("axios");

export default {
    namespaced: true,
    state: {
        News: [],
        DataComment:[],
    },
    getters: {
        data: state => state.News,
    },
    actions: {
        loadNews({ commit }) {
            return new Promise((res, rej) => {
                var base_url =
                //   "http://192.168.1.10/music%20project/music%20project/public/api/News";
                  `${process.env.VUE_APP_base_url}/News`;
                 axios
                  .get(base_url)
                  .then((response) => {
                    var Data = response.data.data;

                    var base_url2 =
                    // "http://192.168.1.10/music%20project/music%20project/public/api/comments/News";
                    `${process.env.VUE_APP_base_url}/comments/News`;
            
                  axios.get(base_url2).then((responseComment) => {
                    var DataComment = responseComment.data.data;
                    commit('GET_DataComment', DataComment);
                    for (let n = 0; n < Data.length; n++) {
                        Data[n].comments = [];
                        Data[n].comments = DataComment.filter((e) => {
                          return e.Number == n;
                        });
                      }
                      console.log(Data);
                      commit('GET_News', Data);
                      res();
                      
                    });
                    
                    })
                    .catch((error) => {
                        console.log(error);
                        this.errored = true;
                        rej();
                    });
                // end promise
            });
        }
    },
    mutations: {
        GET_News(state, News) {
            state.News = News;
        },
        GET_DataComment(state, DataComment) {
            state.DataComment = DataComment;
        }
    },

};
