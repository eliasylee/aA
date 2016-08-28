import React from 'react';

class BenchIndexItem extends React.Component {
  render () {
    const { bench } = this.props;

    return (
      <li>{bench.description}</li>
    );
  }
}

export default BenchIndexItem;
