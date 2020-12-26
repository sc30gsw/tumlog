if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function (){
    const imageList = document.getElementById('image-list');

    const imageCreateHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', 'preview');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    };
    
    document.getElementById('saving_image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      imageCreateHTML(blob);
    });
  });
}