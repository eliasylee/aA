import React from 'react';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';
import App from './app';
import SearchContainer from './search_container';
import BenchForm from './bench_form';

const AppRouter = () => (
  <Router history={ hashHistory }>
    <Route path="/" component={ App }>
      <IndexRoute component={ SearchContainer }/>
      <Route path="/benches/new" component={ BenchForm }/>
    </Route>
  </Router>
)

export default AppRouter;
