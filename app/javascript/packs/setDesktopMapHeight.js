

// // let desktopMapStyle = document.getElementById("desktop-map").style
// // let body = document.body,
// // let html = document.documentElement;
// // let height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );

// // desktopMapStyle.marginTop="56px";
// // desktopMapStyle.height="10vh";

// const setDesktopMapHeight = () => {
//   console.log('desktop map height')
//   const mapStyle = document.getElementById("desktop-map").style;
//   // const height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );

//   // console.log(height)

//   // window.pageYOffset
//   const testFn = () => {
//     // console.log('hi')
//     const body = document.body;
//     const html = document.documentElement;
//     const mapStyle = document.getElementById("desktop-map").style;

//     // console.log(mapStyle)
//     // console.log(mapStyle.marginTop)
//     // console.log(mapStyle.height)

//     let scroll = window.pageYOffset
//     let height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );

//     console.log(height - scroll)
//     // mapStyle.height = $height - 56px scroll

//     const marginAtTop = () => 56 > scroll ? (56 - scroll) : 0


//     Math.min(56 - scroll)
//     let heightOfMap = height - marginAtTop()

//     mapStyle.marginTop = `${marginAtTop()}px`;
//     mapStyle.height = `${heightOfMap}px`;
//     // initMap()

//     console.log(heightOfMap)
//     // console.log(marginAtTop)
//     marginAtTop();
//   }

//   window.onscroll = testFn
//   window.onscroll = marginAtTop()
//   // let map = document.querySelector("#desktop-map")

//  }

// export { setDesktopMapHeight };
