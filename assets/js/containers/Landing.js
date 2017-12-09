import React from 'react';
import { Button } from 'semantic-ui-react';

import { driveBackwards, driveForward, turnLeft, turnRight } from '../socket';

const Landing = () => (
  <div className="control-page">
    <h3>Controls</h3>

    <div>
      <div className="controls">
        <Button icon="arrow up" size="huge" onClick={driveForward} />
      </div>

      <div className="controls">
        <Button icon="arrow left" size="huge" onClick={turnLeft} />
        <Button icon="arrow down" size="huge" onClick={driveBackwards} />
        <Button icon="arrow right" size="huge" onClick={turnRight} />
      </div>
    </div>

  </div>
);

export default Landing;
