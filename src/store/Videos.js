
const axios = require("axios");

export default {
    namespaced: true,
    state: {
        apivideos: []
    },
    getters: {
        data: state => state.apivideos,
    },
    actions: {
         loadVideos({commit}) {
            return new Promise(( res, rej ) => {

                let params = {
                part: "snippet",
                playlistId: "PLjs6IhHA5vjDC5YiH7vwnudq5dpv9j_n8",
                key: process.env.VUE_APP_YT_Key ,
                maxResults:50,
            };
        
            var yt = [];
            axios
                .get("https://youtube.googleapis.com/youtube/v3/playlistItems?", { params })
                .then((response) => {
                        // comments
                        var base_url =
                            // "http://192.168.1.10/music%20project/music%20project/public/api/comments/Videos";
                            "http://asmusicbackend-07251.herokuapp.com/public/api/comments/Videos";
                        axios
                            .get(base_url)
                            .then((responseComment) => {
                                var DataComment = responseComment.data.data;
                                // console.log(DataComment);
        
                        var ytvideo = response.data.items;
                        for (let n = 0; n < ytvideo.length; n++) {
                            yt[n] = {
                                title: ytvideo[n].snippet.title,
                                description: ytvideo[n].snippet.description,
                                sources: [
                                    "https://www.youtube.com/embed/" +
                                    ytvideo[n].snippet.resourceId.videoId + "?enablejsapi=1&version=3&playerapiid=ytplayer",
                                ],
                                position: ytvideo[n].snippet.position,
                                publishedAt: ytvideo[n].snippet.publishedAt,
                                thumbnails: ytvideo[n].snippet.thumbnails,
                                comments:DataComment
                                .filter((e)=>{
                                    return e.Number == n
                                })
                            };
                        }
                        // console.log(yt);
                     commit('GET_Videos', yt);
                     res(yt);
                    }); //end comments
                
                }) //ytvideos
                .catch((error) => {
                    console.log(error);
                    this.errored = true;
                    rej(error);
                })
                .finally(() => (this.loading = false));
            });
            // end promise
          }
    },
    mutations: {
        GET_Videos(state, videos) {
            state.apivideos = videos; 
        }
    },

};
