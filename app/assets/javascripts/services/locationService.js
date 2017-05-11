angular
  .module('eventPlanner')
  .service('LocationService', LocationService);

LocationService.$inject = ['$http'];

function LocationService($http) {
  const self = this;
	
	self.GoogleAPIKey = 'AIzaSyCZyqLNZP3P4zpkKiECu84Ukwz3a40caEM'

  self.getUserLocation = getUserLocation;
  self.reverseGeocodeLocation = reverseGeocodeLocation;

  function getUserLocation() {
    return new Promise(function waitForLocation(resolve, reject) {
      navigator
        .geolocation
        .getCurrentPosition(function successfullyGotLocation(position) {
          resolve(position);
        }, function unsuccessfullyGotLocation(error) {
          reject(error);
        });
    })
  }
  function reverseGeocodeLocation(latlng) {
    return $http
      .get(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng}&key=${self.GoogleAPIKey}`)
  }
}
