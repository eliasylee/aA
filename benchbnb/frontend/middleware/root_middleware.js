import { applyMiddleware } from 'redux';
import BenchesMiddleware from './benches_middleware';
import SessionMiddleWare from './session_middleware';

const RootMiddleware = applyMiddleware(
  BenchesMiddleware,
  SessionMiddleWare
);

export default RootMiddleware;
