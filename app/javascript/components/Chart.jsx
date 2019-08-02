import React from "react"
import Bar from '../components/Bar';

class Chart extends React.Component {
  constructor (props) {
    super(props);
    this.state = {serviceData: {}, dataLoaded: false}
  }
  componentDidMount () {
    fetch('/v1/deals.json')
      .then(res => res.json())
      .then(
        (serviceData) => {
          let maxValue = Math.max(...Object.values(serviceData));
          this.setState({
            serviceData: serviceData,
            maxValue: maxValue,
            dataLoaded: true
          });
        },
        (error) => {
          alert("Failed to load data.");
        }
      )
  }

  render () {
    return (
      <div className="chart">
        <Bar stage="Lost" 
             aggregateValue={this.state.serviceData.lost || 0.0}
             maxValue={this.state.maxValue}
        />
        <Bar stage="Qualified"
             aggregateValue={this.state.serviceData.qualified || 0.0}
             maxValue={this.state.maxValue}
        />
        <Bar stage="Request for Info"
             aggregateValue={this.state.serviceData.requestForInfo || 0.0}
             maxValue={this.state.maxValue}
        />
        <Bar stage="Negotiation"
             aggregateValue={this.state.serviceData.negotiation || 0.0}
             maxValue={this.state.maxValue}
        />
        <Bar stage="Presentation"
             aggregateValue={this.state.serviceData.presentation || 0.0}
             maxValue={this.state.maxValue}
        />
        <Bar stage="Won"
             aggregateValue={this.state.serviceData.won || 0.0}
             maxValue={this.state.maxValue}
        />
      </div>
    );
  }
}

export default Chart

  // STAGE_TO_PERCENT = {
  //   'Won' => 100,
  //   'Presentation' => 50,
  //   'Negotiation' => 75,
  //   'Request for Info' => 25,
  //   'Qualified' => 10,
  //   'Lost' => 0,
  // }