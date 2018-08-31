import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
  }

  componentDidMount() {
    this.interval = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  tick() {
    this.setState({
      time: new Date()
    });
  }

  render() {
    return (
      <div className="section clock">
        <h2 className="section-header">Clock</h2>
        <div className="flex-parent">
          <p>Time:</p>
          <p>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</p>
        </div>
        <div className="flex-parent">
          <p>Date:</p>
          <p>{this.state.time.toDateString()}</p>
        </div>
      </div>
    );
  }
}

export default Clock;
