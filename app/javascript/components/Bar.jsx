import React from "react"
import PropTypes from "prop-types"
class Bar extends React.Component {
  render () {
    const percentageOfMaxValue = 100.0 * this.props.aggregateValue / this.props.maxValue;
    const inlineStyle = {height: percentageOfMaxValue.toString() + '%'}

    return (
      <div className={"column " + this.props.stage.toLowerCase()}>
        <div style={inlineStyle}>
           {this.props.aggregateValue}
        </div>
        <div className="stage">
          {this.props.stage}
        </div>
      </div>
    );
  }
}

Bar.propTypes = {
  aggregateValue: PropTypes.number,
  maxValue: PropTypes.number,
  stage: PropTypes.string
};

export default Bar
