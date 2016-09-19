import React from 'react';
import ReactDOM from 'react-dom';

import Game from './components/game';

document.addEventListener("DOMContentLoaded", () => {
	const root = document.querySelector("#root");
	ReactDOM.render(<Game />, root);
});
