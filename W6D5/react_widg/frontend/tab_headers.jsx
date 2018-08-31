import React from 'react';

class TabHeaders extends React.Component {
  handleClick(idx) {
    this.props.currentTabCB(idx);
  }

  render() {
    return (
      <div className="tab-headers">
        <ul className="flex-parent tab-header-list">
          {
            this.props.tabs.map((obj, idx) => {
              return (
                <li onClick={this.handleClick.bind(this, idx)} className={idx === this.props.currentTab ? "selected" : ""}>
                  <h3>{obj.title}</h3>
                </li>
              );
            })
          }
        </ul>
      </div>
    );
  }
}

export default TabHeaders;
