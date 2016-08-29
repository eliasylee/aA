import React from 'react';
import { requestBenches } from '../actions/bench_actions';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  render () {
    const { benches } = this.props;

    return (
      <section className="benchIndex">
        { Object.keys(benches).map( key => {
          return (
            < BenchIndexItem key={key} bench={benches[key]} />
          );
        })}
      </section>
    );
  }
}

export default BenchIndex;
