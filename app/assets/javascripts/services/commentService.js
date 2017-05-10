angular
  .module('eventPlanner')
  .service('CommentService', CommentService);

CommentService.$inject = ['$http'];

function CommentService($http) {
  const self = this;

  self.postComment = postComment;
	self.deleteComment = deleteComment;

	function deleteComment(eventId, id) {
		return $http.delete(`/api/events/${eventId}/comments/${id}`)
	}
  function postComment(comment, id){
    return $http.post(`/api/events/${id}/comments`, comment)
  }
}
