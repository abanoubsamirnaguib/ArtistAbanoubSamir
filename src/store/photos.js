
const axios = require("axios");

export default {
    namespaced: true,
    state: {
        apiPhotos: []
    },
    getters: {
        data: state => state.apiPhotos,
    },
    actions: {
        loadPhotos({ commit }) {
            return new Promise((res, rej) => {

                let params = {
                    fields: 'id,media_type,media_url,username,timestamp,caption,permalink',
                    access_token: process.env.VUE_APP_IG_Token,
                    limit: 100
                };
                var User_ID = '4288035421306609';
                var User_Data_url =
                    `https://graph.instagram.com/${User_ID}/media?`;
                // 'http://192.168.1.10/music%20project/music%20project/public/api/photoApi';


                var Image_Data = [];
                axios
                    .get(User_Data_url,
                     { params }
                )
                    .then((response) => {
                     
                            // comment api
                            var base_url =
                                // "http://192.168.1.10/music%20project/music%20project/public/api/comments/Photos";
                                "http://asmusicbackend-07251.herokuapp.com/public/api/comments/Photos";
                            axios
                                .get(base_url)
                                .then((responseComment) => {
                                    var DataComment = responseComment.data.data;
                                    // console.log(DataComment);
            
                                    // console.log(response.data.data);
                                    //IG
                                    var Data = response.data.data;
                                    // var Data = response.data;
                                    let x = 0;
                                    for (let n = 0; n < Data.length; n++) {
                                        if ((Data[n].media_type) !== "VIDEO") {
                                            Image_Data[x] = {
                                                title: `Photo ${x + 1}`,
                                                description: Data[n].caption || "Hello",
                                                src: Data[n].media_url,
                                                position: x,
                                                publishedAt: Data[n].timestamp,
                                                permalink: Data[n].permalink,
                                                IG_ID: Data[n].id,
                                                media_type: Data[n].media_type,
                                                comments:[]                                                        
                                            };
                                            for (let i = 0; i < DataComment.length; i++){
                                                if(DataComment[i].Number == x){
                                                    Image_Data[x].comments.push(DataComment[i]);
                                                }
                                            }
                                            x++;
                                        }
                                    }
                                    // console.log(Image_Data);
                                    commit('GET_Photos', Image_Data);
                                    res(Image_Data);
                                });//end comments
                        
                    })//end IG
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
        GET_Photos(state, Photos) {
            state.apiPhotos = Photos;
        }
    },

};
