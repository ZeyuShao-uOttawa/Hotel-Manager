import React, {Fragment} from 'react';
import './App.css';

//Components
import RoomList from './components/RoomList';

function App() {
  return (
    <Fragment>
      <div className="container">
        <RoomList />
      </div>
    </Fragment>
  );
}

export default App;
