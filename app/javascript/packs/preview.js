function preview(){
  const imageList = document.getElementById('image-list');
  document.getElementById('exercise_image').addEventListener('change', function (e){
    console.log(e);
  })
}
window.addEventListener('load', preview);