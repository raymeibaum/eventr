angular
  .module('eventPlanner')
  .service('UserService', UserService);

UserService.$inject = ['$http'];

function UserService($http) {
  const self = this;

	this.getUser = getUser;

	function getUser(id) {
		return $http.get('/api/users/' + id)
	}
}
