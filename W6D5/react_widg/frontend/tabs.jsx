import React from 'react';
import TabHeaders from './tab_headers';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentTab: 0
    };
  }

  setCurrentTab(tabNum) {
    this.setState({currentTab: tabNum });
  }

  render() {
    const objs = this.props.objects;

    return(
      <div className="section tabs">
        <h2 className="section-header">Tabs</h2>
        <TabHeaders tabs={objs} currentTabCB={this.setCurrentTab.bind(this)} currentTab={this.state.currentTab}/>
        <article className="tab-content">
          <p>{objs[this.state.currentTab].content}</p>
        </article>
      </div>
    );
  }
}

export default Tabs;
