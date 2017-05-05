angular
  .module('eventPlanner')
  .service('EventService', EventService);

EventService.$inject = ['$http'];

function EventService($http) {
  const self = this;

  self.getCategories = getCategories;
  self.getEventsForCategory = getEventsForCategory;
	self.getAllEventsForLocation = getAllEventsForLocation;

  function getCategories() {
    return $http.get('/api/events/category');
  }
  function getEventsForCategory(latlng, category) {
    return $http.get(`/api/events?latlng=${latlng}&category=${category}`);
  }
	function getAllEventsForLocation(latlng) {
		return $http.get(`/api/events?latlng=${latlng}`);
	}
}
