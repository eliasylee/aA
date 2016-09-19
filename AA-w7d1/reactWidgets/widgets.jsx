import React from 'react';
import ReactDOM from 'react-dom';

import Tabs from './tabs';
import WeatherClock from './weatherClock';
import AutoComplete from './autoComplete';

const tabsData = [
	{ title: "one", content: "hello" },
	{ title: "two", content: "world" },
	{ title: "three", content: "goodbye" }
];

const names = [
	"Eli ReallycoolGui",
	"Eric TheworstGui"
];

document.addEventListener("DOMContentLoaded", () => {
	const root = document.querySelector("#root");
	ReactDOM.render(<Widgets />, root);
});

class Widgets extends React.Component {
	render() {
		return (
			<div>
				<WeatherClock />
				<Tabs panes={tabsData} />
				<AutoComplete names={names} />
			</div>
		);
	}
}
