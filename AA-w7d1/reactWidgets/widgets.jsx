import React from 'react';
import ReactDOM from 'react-dom';

import Tabs from './tabs';

const tabsData = [
	{ title: "one", content: "hello" },
	{ title: "two", content: "world" },
	{ title: "three", content: "goodbye" }
];

document.addEventListener("DOMContentLoaded", () => {
	const root = document.querySelector("#root");
	ReactDOM.render(<Tabs panes={tabsData}/>, root);
});
