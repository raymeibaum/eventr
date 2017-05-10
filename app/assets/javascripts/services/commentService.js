angular
  .module('eventPlanner')
  .service('CommentService', CommentService);

CommentService.$inject = ['$http'];

function CommentService($http) {
  const self = this;

  self.postComment = postComment;


  function postComment(comment, id){
      return $http.post(`/api/events/${id}/comments`, comment)
  }
}
