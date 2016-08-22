import React from 'react';

class Tabs extends React.Component {
  constructor() {
    super();
    this.state = { selectedTab: 0 };
    this.renderTabs = this.renderTabs.bind(this);
  }

  renderTabs() {
    return this.props.panes.map( pane => {
      return <h1 key={pane.title}
                 onClick={this.updateTab.bind(this, pane)}>
                 {pane.title}
             </h1>;
    });
  }

  updateTab(pane) {
    let paneIdx = this.props.panes.indexOf(pane);
    this.setState({ selectedTab: paneIdx });
  }

  render() {
    return (
      <div>
        <header>Tabs</header>
        <ul className="tabs-list">
          <span>{this.renderTabs()}</span>
        </ul>
        <article>{this.props.panes[this.state.selectedTab].content}</article>
      </div>
    );
  }
}

export default Tabs;
