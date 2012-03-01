function initCufon() {
	 Cufon.replace('h1,h2,h3,h4,h5,h6,#titles-des li a', { fontFamily: 'Vegur' });  Cufon.replace('.post-title.cufonheading', { fontFamily: 'Vegur' });  Cufon.replace('.post.thumb h2,', { fontFamily: 'Vegur' });  Cufon.replace('.post.frontpage > h2', { fontFamily: 'Vegur' });  Cufon.replace('.widgetheading h2', { fontFamily: 'Vegur' }); 
	
}

(function($) {
        $(function() {

$(document).ready(function(){
	initCufon();
});

		
          });
    })(jQuery);     
