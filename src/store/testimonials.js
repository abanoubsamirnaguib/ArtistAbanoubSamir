
const axios = require("axios");

export default {
    namespaced: true,
    state: {
        testimonials: []
    },
    getters: {
        data: state => state.testimonials,
    },
    actions: {
        loadTestimonials({ commit }) {
            return new Promise((res, rej) => {

                var base_url =
                    // "http://192.168.1.10/music%20project/music%20project/public/api/testimonials";
                    "http://asmusicbackend-07251.herokuapp.com/public/api/testimonials";
                axios
                    .get(base_url)
                    .then((response) => {
                        var Data = response.data.data;
                        commit('GET_Testimonials', Data);
                        res();
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
        GET_Testimonials(state, testimonials) {
            state.testimonials = testimonials;
        }
    },

};
