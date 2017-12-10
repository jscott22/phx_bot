import React, { Component } from 'react';
import { Button } from 'semantic-ui-react';

import * as control from '../socket';

const onKeyDown = (key) => {
  switch (key) {
    case 'w':
      return control.driveForward();
    case 'a':
      return control.driveLeft();
    case 's':
      return control.driveBackwards();
    case 'd':
      return control.driveRight();
    default:
      return false;
  }
};

const onKeyUp = (key) => {
  switch (key) {
    case 'w':
      return control.stopForward();
    case 'a':
      return control.stopLeft();
    case 's':
      return control.stopBackwards();
    case 'd':
      return control.stopRight();
    default:
      return false;
  }
};

class Controls extends Component {
  constructor(props) {
    super(props);

    this.keyDown = false;
  }

  componentDidMount() {
    document.addEventListener('keydown', (e) => {
      if (!this.keyDown) {
        this.keyDown = true;
        onKeyDown(e.key.toLowerCase());
      }
    });

    document.addEventListener('keyup', (e) => {
      this.keyDown = false;
      onKeyUp(e.key.toLowerCase());
    });
  }

  render() {
    return (
      <div className="control-page">
        <h3>Controls</h3>

        <div>
          <div className="controls">
            <Button
              icon="arrow up"
              size="huge"
              onMouseDown={control.driveForward}
              onMouseUp={control.stopForward}
            />
          </div>

          <div className="controls">
            <Button
              icon="arrow left"
              size="huge"
              onMouseDown={control.driveLeft}
              onMouseUp={control.stopLeft}
            />
            <Button
              icon="arrow down"
              size="huge"
              onMouseDown={control.driveBackwards}
              onMouseUp={control.stopBackwards}
            />
            <Button
              icon="arrow right"
              size="huge"
              onMouseDown={control.driveRight}
              onMouseUp={control.stopRight}
            />
          </div>
        </div>
      </div>
    );
  }
}

export default Controls;
