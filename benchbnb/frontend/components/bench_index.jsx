import React from 'react';
import { requestBenches } from '../actions/bench_actions';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  componentDidMount () {
    this.props.requestBenches();
  }

  render () {
    const { benches } = this.props;

    return (
      <section className="benchIndex">
        { benches.map( bench => {
          return (
            < BenchIndexItem key={bench.id} bench={bench} />
          );
        })}
      </section>
    );
  }
}

export default BenchIndex;
