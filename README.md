# Redux GraphQL

A set of tools to use in your Redux Projects
to easily consume GraphQL data. This is *not* meant to be a replacement for [Relay](http://facebook.github.io/relay), and doesn't aim to solve most any of the problems that Relay solves.

Oh yeah, and there's no code here yet.

The intended API will look like this:


```javascript
// App.js

import React, { Component } from 'react';
import { Container as GraphQLContainer } from 'redux-graphql';
import WidgetList from 'components/WidgetList';

const WidgetQueries = {
  widgets: () => `
    widgets(first: 15) {
      edges {
        node {
          id,
          name,
        },
      },
    }
  `,
};

export default class App extends Component {
  render() {
    return (
      <GraphQLContainer
        root="viewer"
        queries={WidgetQueries}>
        <WidgetList />
      </GraphQLContainer>
    );
  }
}
```

```javascript
// WidgetList.js

import React, { Component } from 'react';

type Widget = {
  id: string;
  name: string;
};

type P = {
  widgets: {edges: Array<Widget>};
};

const Widget = ({ name }) => <li>{name}</li>;

export default class WidgetList extends Component {
  static defaultProps: P;
  props: P;

  renderWidget(): any {
    if (!this.props.widgets.edges.length) {
      return (
        <p>No widgets...</p>
      );
    }

    const widgets = this.props.widgets.edges.map((widget, key) => (
      <Widget
        key={key}
        {...name} />
    ));

    return (
      <ul>{widgets}</ul>
    );
  }

  render(): any {
    return (
      <div>{this.renderWidgets()}</div>
    );
  }
}
```
