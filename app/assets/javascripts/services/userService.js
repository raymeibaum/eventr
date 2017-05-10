angular
  .module('eventPlanner')
  .service('UserService', UserService);

UserService.$inject = ['$http'];

function UserService($http) {
  const self = this;

	this.getUser = getUser;
	this.getLoggedInUser = getLoggedInUser;

	function getUser(id) {
		return $http.get('/api/users/' + id);
	}
	function getLoggedInUser() {
		return $http.get('/api/auth/user');
	}
}
