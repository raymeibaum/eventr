angular
  .module('eventPlanner')
  .service('FavoritesService', FavoritesService);

FavoritesService.$inject = ['$http'];

function FavoritesService($http) {
  const self = this;

	self.favoriteEvent = favoriteEvent;
	// self.unfavoriteEvent = unfavoriteEvent;

	function favoriteEvent(eventId) {
		return $http.post('/api/events/' + eventId + '/eventUser');
	}
	// function unfavoriteEvent(eventId) {
	// 	return $http.destroy('/api/favorites/' + eventId);
	// }
}
