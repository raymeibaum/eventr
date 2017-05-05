angular
  .module('eventPlanner')
  .service('EventService', EventService);

EventService.$inject = ['$http'];

function EventService($http) {
  const self = this;

  self.getCategories = getCategories;
  self.getEvents = getEvents;
  self.showEvent = showEvent;

  function getCategories() {
    return $http.get('/api/events/categories');
  }
  function getEvents(latlng, category) {
    return $http.get(`/api/events?latlng=${latlng}&category=${category}`);
  }
  function showEvent(id) {
    return $http.get(`/api/events/get?id=${id}`);
  }
}
