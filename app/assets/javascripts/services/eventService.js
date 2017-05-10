angular
  .module('eventPlanner')
  .service('EventService', EventService);

EventService.$inject = ['$http'];

function EventService($http) {
  const self = this;

  self.getCategories = getCategories;
  self.getEventsWithSpecifics = getEventsWithSpecifics;
	self.getAllEventsForLocation = getAllEventsForLocation;
	self.getEvent = getEvent;

  function getCategories() {
    return $http.get('/api/events/categories');
  }
  function getEventsWithSpecifics(latlng, category, date) {
    return $http.get(`/api/events/categories/${category}?latlng=${latlng}&date=${date}`);
  }
	function getAllEventsForLocation(latlng) {
		return $http.get(`/api/events?latlng=${latlng}`);
	}
	function getEvent(id) {
		return $http.get(`/api/events/${id}`);
	}
}
