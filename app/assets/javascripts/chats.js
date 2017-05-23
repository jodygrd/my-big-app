// document.addEventListener("DOMContentLoaded", function(event) { 
//   var app = new Vue({
//     el: '#chatable',
//     data: {
//         loaded: false,
//         chat_array: [],
//         message: 'End Vue',
//         groupId: '',
//         userId: '',
//         newChat: '',
//     },
//     mounted: function() {
//     	this.groupId = document.querySelector("#groupId").innerHTML;
//         this.userId = document.querySelector("#userId").innerHTML;
//     	console.log(this.userId);
//     	this.loaded=true
//     	console.log("loaded")
// 		var api_url = "http://localhost:5000/api/v1/chats/"+this.groupId;
//     	$.get(api_url, function(result) {
//     		this.chat_array = result;
//     		console.log(result);
//     	}.bind(this))
//     },
//     methods: {
//     	postNewChat: function() {
//     		var params = {
//     			group_id: this.groupId,
//     			user_id: this.userId,
//     			content: this.newChat
//     		};
//     		var api_url = "http://localhost:3000/api/v1/comments";
//     		$.post(api_url, params, function(result){
//     			this.chat_array.push(result)
//     		}.bind(this));
//     		this.newChat = '';
//     	},
//     },
//   });
// });