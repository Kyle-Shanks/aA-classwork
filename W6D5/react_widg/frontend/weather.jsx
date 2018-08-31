import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      lat: 0,
      long: 0,
      loc: '',
      temp: null
    };
  }

  componentDidMount() {
    // Get location
    navigator.geolocation.getCurrentPosition((res) => {
      // Setting location state
      this.setState({lat: res.coords.latitude, long: res.coords.longitude}, () => {
        // Actually call api
        console.log(this.state);
        $.ajax(`http://api.openweathermap.org/data/2.5/weather?lat=${this.state.lat}&lon=${this.state.long}&appid=e4c0933f8babbd967dfa040ea3baac63`)
        .then((apiRes) => {
          // Setting weather state
          console.log(apiRes, 'success');
          this.setState({temp: apiRes.main.temp, loc: apiRes.name});
        });
      });
    });
  }

  render() {
    return (
      <div className="section weather">
        <h2 className="section-header">Weather</h2>
        <p>{this.state.loc}</p>
        <p>{this.state.temp ? Math.round((parseFloat(this.state.temp) * 9 / 5 - 459.67)*100)/100+' Degrees' : 'Loading....'}</p>
      </div>
    );
  }
}

export default Weather;
