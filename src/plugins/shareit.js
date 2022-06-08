
const shareit = {
    install(Vue) {
      Vue.prototype.shareitAction = async (title , text ,url) => {
        if (navigator.canShare){
            const shareData = {
                title: title,
                text: text,
                url: url
              }
              console.log(shareData);
              try {
                await navigator.share(shareData)
                console.log('shareit shared successfully'); 
                // alert('shareit shared successfully'); 
              } catch(err) {
                console.log('Error: ' + err); 
                // alert('Error: ' + err); 
              }
          } 
          else {
            // console.log('shareit Cant process'); 
            alert('shareit Cant process'); 
          }
        } 
    },
  }
  export default shareit;