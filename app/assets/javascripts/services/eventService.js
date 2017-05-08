angular
  .module('eventPlanner')
  .service('EventService', EventService);

EventService.$inject = ['$http'];

function EventService($http) {
  const self = this;

  self.getCategories = getCategories;
  self.getEventsForCategory = getEventsForCategory;
	self.getAllEventsForLocation = getAllEventsForLocation;
	self.getEvent = getEvent;
	self.persistEvent = persistEvent;

  function getCategories() {
    return $http.get('/api/events/categories');
  }
  function getEventsForCategory(latlng, category) {
    return $http.get(`/api/events/categories/${category}?latlng=${latlng}`);
  }
	function getAllEventsForLocation(latlng) {
		return $http.get(`/api/events?latlng=${latlng}`);
	}
	function getEvent(id) {
		return $http.get(`/api/events/${id}`);
	}
	function persistEvent(id) {
		return $http.post(`/api/events?id=${id}`);
	}
}
