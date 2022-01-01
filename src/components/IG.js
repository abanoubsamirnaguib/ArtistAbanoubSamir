// IGQVJWaEFPYnRqNkJNQXVBY2RlZAU91ZATZAaWjc5YnFvMVhkU2poWE1EcEVvMnAybzRkckVpWWJRUmRhUXdJRVRiWVdjYXkxbDZAkYjVBUDl0ckJRMlRSVVpFTW5pMzlhVDc4MXlBc0lOQ0NsbGxjZAUpJZAAZDZD

const axios = require("axios");
var User_ID = '4288035421306609';
var User_Data_url =
     `https://graph.instagram.com/${User_ID}/media?`;
    // 'http://192.168.1.10/music%20project/music%20project/public/api/photoApi';

module.exports = function (Callback) {

    let params = {
        fields: 'id,media_type,media_url,username,timestamp,caption,permalink',
        access_token: "IGQVJWaEFPYnRqNkJNQXVBY2RlZAU91ZATZAaWjc5YnFvMVhkU2poWE1EcEVvMnAybzRkckVpWWJRUmRhUXdJRVRiWVdjYXkxbDZAkYjVBUDl0ckJRMlRSVVpFTW5pMzlhVDc4MXlBc0lOQ0NsbGxjZAUpJZAAZDZD",
        limit: 100
    };
    var Image_Data = [];
    axios
        .get(User_Data_url,
         { params }
    )
        .then((response) => {
            if (Callback) {
                // comment api
                var base_url =
                    "http://192.168.1.10/music%20project/music%20project/public/api/comments/Photos";
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
                        Callback(Image_Data)
                    });//end comments
            }
        })//end IG
        .catch((error) => {
            console.log(error);
            this.errored = true;
        })
        .finally(() => (this.loading = false));

};