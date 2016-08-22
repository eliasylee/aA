import React from 'react';
import ReactDOM from 'react-dom';

import Game from './components/react_minesweeper';

document.addEventListener("DOMContentLoaded", () => {
	const root = document.querySelector("#root");
	ReactDOM.render(<Game />, root);
});
