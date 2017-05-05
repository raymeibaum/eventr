angular
  .module('eventPlanner')
  .service('EventService', EventService);

EventService.$inject = ['$http'];

function EventService($http) {
  const self = this;

  self.getCategories = getCategories;
  self.getEvents = getEvents;
  // self.loadEvent = loadEvent;

  function getCategories() {
    return $http.get('/api/events/categories');
  }
  function getEvents(latlng, category) {
    return $http.get(`/api/events?latlng=${latlng}&category=${category}`);
  }
  // function loadEvent(id) {
  //   return $http.get(`/api/events/get?id=${id}`);
  // }
}
