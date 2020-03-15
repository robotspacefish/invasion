import Player from './player';
import Enemy from './enemy';
import GameObject from './gameObject';
import TitleScreen from './titleScreen';
import { GAME_WIDTH, GAME_HEIGHT } from './index';

export default class Game {
  constructor(width, height) {
    this.width = width;
    this.height = height;
    this.player = new Player();
    this.container = document.getElementById('game-content');
    this.mode = "title";
    this.screens = this.initScreens();
    this.ctx;
    this.shouldUpdateUI = false;
  }

  static get enemiesOnScreenLimit() {
    return 5;
  }

  initScreens() {
    return {
      title: new TitleScreen(this.container),
      // gameOver: new GameOverScreen(this.container)
    }
  }

  update() {
    if (this.mode === "play") {
      if (GameObject.enemyCount <= Game.enemiesOnScreenLimit && Enemy.shouldSpawn()) {
        Enemy.spawn();
      }

      GameObject.all.forEach(obj => obj.update());

      if (this.player.isHit) {
        console.log('game over')
        // game over
        // show score
        // allow player to enter name
      }
    }
  }

  draw() {
    this.ctx.clearRect(0, 0, GAME_WIDTH, GAME_HEIGHT);
    if (this.mode === "play") {
      GameObject.all.forEach(obj => obj.draw(this.ctx));
    }
  }

  static renderScore(points) {
    document.getElementById('score-bar').innerHTML = points;
  }

  renderCanvas() {
    this.container.innerHTML = `
      <div class="ui">
        <div id="score-bar">
          ${this.player.points}
        </div>
      </div>
      <div id="screen-bg">
        <canvas id="screen" width="800" height="600"></canvas>
      </div>
    `;

    this.setContext();
  }

  setContext() {
    this.ctx = document.getElementById('screen').getContext('2d');
  }

  // setScoreBar() {
  //   debugger
  //   this.scoreBar = document.getElementById('score-bar');
  // }
}