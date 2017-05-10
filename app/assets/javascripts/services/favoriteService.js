angular
  .module('eventPlanner')
  .service('FavoriteService', FavoriteService);

FavoriteService.$inject = ['$http'];

function FavoriteService($http) {
  const self = this;

	self.addFavorite = addFavorite;
	self.removeFavorite = removeFavorite;

	function addFavorite(eventId) {
		return $http.post(`/api/events/${eventId}/favorites`);
	}
	function removeFavorite(eventId, id) {
		return $http.delete(`/api/events/${eventId}/favorites/${id}`);
	}
}
