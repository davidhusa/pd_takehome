import React from "react";
import PropTypes from "prop-types";
import Chart from '../components/Chart';
import '../src/home'
class Home extends React.Component {
  render () {
    return (
      <Chart />
    );
  }
}

Home.propTypes = {
  foo: PropTypes.number
};
export default Home
