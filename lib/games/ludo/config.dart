const gameWidth = 900.0;
const gameHeight = 1600.0;

//47 steps [0...46]
const playerRouteMap = {
  0: [
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 15],
    [1, 12],
    [1, 9],
    [1, 6],
    [1, 3],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 5],
    [1, 8],
    [1, 11],
    [1, 14],
    [1, 17],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [2, 11],
    [2, 17],
    [2, 16],
    [2, 15],
    [2, 14],
    [2, 13],
    [2, 12],
    [3, 2],
    [3, 5],
    [3, 8],
    [3, 11],
    [3, 14],
    [3, 17],
    [3, 16],
    [3, 15],
    [3, 12],
    [3, 9],
    [3, 6],
    [3, 3],
    [3, 0],
    [0, 17],
    [0, 16],
    [0, 15],
    [0, 14],
    [0, 13],
    [0, 12],
    [0, 6],
    [0, 7],
    [0, 8],
    [0, 9],
    [0, 10],
    [0, 11],
  ],
  1: [
    [1, 5],
    [1, 8],
    [1, 11],
    [1, 14],
    [1, 17],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [2, 11],
    [2, 17],
    [2, 16],
    [2, 15],
    [2, 14],
    [2, 13],
    [2, 12],
    [3, 2],
    [3, 5],
    [3, 8],
    [3, 11],
    [3, 14],
    [3, 17],
    [3, 16],
    [3, 15],
    [3, 12],
    [3, 9],
    [3, 6],
    [3, 3],
    [3, 0],
    [0, 17],
    [0, 16],
    [0, 15],
    [0, 14],
    [0, 13],
    [0, 12],
    [0, 6],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 15],
    [1, 12],
    [1, 9],
    [1, 6],
    [1, 3],
    [1, 0],
    [1, 1],
    [1, 4],
    [1, 7],
    [1, 10],
    [1, 13],
    [1, 16],
  ],
  2: [
    [2, 16],
    [2, 15],
    [2, 14],
    [2, 13],
    [2, 12],
    [3, 2],
    [3, 5],
    [3, 8],
    [3, 11],
    [3, 14],
    [3, 17],
    [3, 16],
    [3, 15],
    [3, 12],
    [3, 9],
    [3, 6],
    [3, 3],
    [3, 0],
    [0, 17],
    [0, 16],
    [0, 15],
    [0, 14],
    [0, 13],
    [0, 12],
    [0, 6],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 15],
    [1, 12],
    [1, 9],
    [1, 6],
    [1, 3],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 5],
    [1, 8],
    [1, 11],
    [1, 14],
    [1, 17],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [2, 11],
    [2, 10],
    [2, 9],
    [2, 8],
    [2, 7],
    [2, 6],
  ],
  3: [
    [3, 12],
    [3, 9],
    [3, 6],
    [3, 3],
    [3, 0],
    [0, 17],
    [0, 16],
    [0, 15],
    [0, 14],
    [0, 13],
    [0, 12],
    [0, 6],
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [0, 4],
    [0, 5],
    [1, 15],
    [1, 12],
    [1, 9],
    [1, 6],
    [1, 3],
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 5],
    [1, 8],
    [1, 11],
    [1, 14],
    [1, 17],
    [2, 0],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [2, 11],
    [2, 17],
    [2, 16],
    [2, 15],
    [2, 14],
    [2, 13],
    [2, 12],
    [3, 2],
    [3, 5],
    [3, 8],
    [3, 11],
    [3, 14],
    [3, 17],
    [3, 16],
    [3, 13],
    [3, 10],
    [3, 7],
    [3, 4],
    [3, 1],
  ],
};
