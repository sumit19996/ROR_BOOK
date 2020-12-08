//= require jquery.min
//= require bootstrap.min
//= require jquery3
//= require jquery_ujs
import "@fortawesome/fontawesome-free/js/all";
$(function(){
		$(".post-like").on("click",function(){
			var post_id = $(this).data("id");

			$.ajax({
				url: "/post/like/"+post_id,
				method: "GET"
			}).done(function(response){
				console.log(response);
				})
		})
});
