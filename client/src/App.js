import React, { Fragment, useState } from 'react';
import { Tab, Tabs } from 'react-bootstrap'
import './App.css';

//Components
import CustomerView from './components/CustomerView';
// import Tabs from './components/Tabs'

function App() {
  const [tabKey, initTabKey] = useState('one')
  return (
    <Fragment>
      <div className='container'>
        <h2 className="mb-3 text-center">Hotel Booking/Management</h2>
        <Tabs activeKey={tabKey} onSelect={(e) => initTabKey(e)}>
          <Tab eventKey="one" title="Customer">
            <CustomerView />
          </Tab>
          <Tab eventKey="two" title="Employee">
            <p>Tab 2</p>
          </Tab>
        </Tabs>
      </div>
    </Fragment>
  );
}

export default App;
