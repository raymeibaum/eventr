angular
  .module('eventPlanner')
  .service('FavoritesService', FavoritesService);

FavoritesService.$inject = ['$http'];

function FavoritesService($http) {
  const self = this;

	self.favoriteEvent = favoriteEvent;

	function favoriteEvent(eventId) {
		return $http.post('/api/favorites/' + eventId);
	}
}
