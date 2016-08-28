import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = ({ benches, requestBenches, updateBounds }) => (
  <div>
    <BenchMap
      benches={benches}
      updateBounds={updateBounds} />
    <BenchIndex
      benches={benches}
      requestBenches={requestBenches} />
  </div>
);

export default Search;
