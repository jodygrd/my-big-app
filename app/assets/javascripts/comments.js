document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#commentable',
    data: {
        loaded: false,
        comment_array: [],
        message: 'End Vue',
        draftId: '',
        newComment: '',
        newReply: '',
        commentId: '',
    },
    mounted: function() {
    	this.draftId = document.querySelector("#draftId").innerHTML;
    	console.log(this.draftId);
    	this.loaded=true
    	console.log("loaded")
			var api_url = "/api/v1/drafts/"+this.draftId+"/comments.json";
    	$.get(api_url, function(result) {
    		this.comment_array = result;
    		console.log(result);
    		console.log(this.draftId)
    	}.bind(this))
    },
    methods: {
    	replies: function(comment) {
    		var children = comment.children
    		for (var i = 0; i < children.length; i++) {
    			return children[i].content
    		};
    		console.log("replies are running");
    	},
    	pullId: function(id) {
    		this.draftId = id;
    		console.log(this.draftId)
    	},
    	postNewComment: function() {
    		var params = {
    			commentable_type: "Draft",
    			commentable_id: this.draftId,
    			content: this.newComment
    		};
    		var api_url = "/api/v1/comments";
    		$.post(api_url, params, function(result){
    			this.comment_array.push(result)
    		}.bind(this));
    		this.newComment = '';
    	},
    	postReply: function(parent) {
    		var index = this.comment_array.indexOf(parent);
    		var params = {
    			commentable_type: "Comment",
    			commentable_id: parent.id,
    			content: this.newReply
    		};
    		var api_url = "/api/v1/comments";
    		$.post(api_url, params, function(result){
    			console.log(result);
    			this.comment_array[index].children.push(result);
    		}.bind(this));
            parent.replyVisible = false;
    		this.newReply = '';

    	},
        toggleShowReply: function(comment) {
            comment.replyVisible = true
        }

    },
  });
});

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
//         this.groupId = document.querySelector("#groupId").innerHTML;
//         this.userId = document.querySelector("#userId").innerHTML;
//         console.log(this.groupId);
//         this.loaded=true
//         console.log("loaded")
//         var api_url = "http://localhost:5000/api/v1/chats/"+this.groupId;
//         $.get(api_url, function(result) {
//             this.chat_array = result;
//             console.log(result);
//         }.bind(this))
//     },
//     methods: {
//         postNewChat: function() {
//             var params = {
//                 group_id: this.groupId,
//                 user_id: this.userId,
//                 content: this.newChat
//             };
//             var api_url = "http://localhost:3000/api/v1/comments";
//             $.post(api_url, params, function(result){
//                 this.chat_array.push(result)
//             }.bind(this));
//             this.newChat = '';
//         },
//     },
//   });
// });