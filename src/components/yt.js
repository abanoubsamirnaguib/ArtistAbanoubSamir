const axios = require("axios");

module.exports = function (options, Callback) {
    if (!options.apiKey) {
        throw new Error("key requierd");
    }

    let params = {
        part: "snippet",
        playlistId: "PLjs6IhHA5vjDC5YiH7vwnudq5dpv9j_n8",
        key: "AIzaSyDdK82uTv5IFGcMN9n1qSLRumzLf1z_i9U",
        maxResults:50,
    };

    var yt = [];
    axios
        .get("https://youtube.googleapis.com/youtube/v3/playlistItems?", { params })
        .then((response) => {
            if (Callback) {

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
                Callback(yt)
            }); //end comments
            }
        }) //ytvideos
        .catch((error) => {
            console.log(error);
            this.errored = true;
        })
        .finally(() => (this.loading = false));

};

    // yt({ apiKey: "AIzaSyDdK82uTv5IFGcMN9n1qSLRumzLf1z_i9U" }, (response) => {
    //   this.ytvideo = response;
    //   this.videos=this.ytvideo;
    // for (let n = 0; n < this.ytvideo.length; n++) {
    // this.videos[n]={
    // title: this.ytvideo[n].snippet.title,
    // description: this.ytvideo[n].snippet.description,
    //     sources: [
    //       "https://www.youtube.com/embed/" +
    //         this.ytvideo[n].snippet.resourceId.videoId,
    //     ],
    //     position: this.ytvideo[n].snippet.position,
    //     publishedAt: this.ytvideo[n].snippet.publishedAt,
    //     thumbnails: this.ytvideo[n].snippet.thumbnails,
    //   };
    // }
    // });