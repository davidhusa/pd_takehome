import React from "react"
import PropTypes from "prop-types"
class Bar extends React.Component {
  render () {
    const columnHeight = this.props.aggregateValue / this.props.maxValue * 800;
    const inlineStyle = {height: columnHeight.toString() + 'px'}
    const aggregateValue = parseFloat(this.props.aggregateValue || 0.0).toLocaleString(undefined, {maximumFractionDigits:2});
    const className = "column " + (this.props.stage.toLowerCase().replace(/\s/g, '-'))

    return (
      <div className={className}>
        <div className="bar" style={inlineStyle}>
             <span className="aggregate-value">
             $
             {aggregateValue}
           </span>
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
