// My friend Lee is a fan of foosball (insert/use another 1-on-1 game here). Lee plays in an amateur foosball league, has asked us for help writing a program to understand player rankings.

// We're given some game outcome data like the following:

// [
//   { winner: 'Alice', loser: 'Bob',   loser_points: 3 },
//   { winner: 'Carol', loser: 'Dean',  loser_points: 1 },
//   { winner: 'Elise', loser: 'Bob',   loser_points: 2 },
//   { winner: 'Elise', loser: 'Carol', loser_points: 4 },
//   { winner: 'Alice', loser: 'Carol', loser_points: 2 },
//   { winner: 'Carol', loser: 'Dean',  loser_points: 3 },
//   { winner: 'Dean',  loser: 'Elise', loser_points: 2 },
// ]

// Write a function that returns a list of all the player names (no player should be listed more than once).

// ['Alice', 'Bob', 'Carol', 'Dean', 'Elise']

// -array, contains objects
// -list/return = some sort of loop (for loop/ for of)

// function listOfNames(stats){
//   const names = [];
//   for (let player of stats) {
//     if(!names.includes(player.winner)){
//         names.push(player.winner)
//     }
//     if(!names.includes(player.loser)){
//         names.push(player.loser)
//       }
//   }
//   console.log(names)
//   return names
// }

// listOfNames([
//       { winner: 'Alice', loser: 'Bob',   loser_points: 3 },
//       { winner: 'Carol', loser: 'Dean',  loser_points: 1 },
//       { winner: 'Elise', loser: 'Bob',   loser_points: 2 },
//       { winner: 'Elise', loser: 'Carol', loser_points: 4 },
//       { winner: 'Alice', loser: 'Carol', loser_points: 2 },
//       { winner: 'Carol', loser: 'Dean',  loser_points: 3 },
//       { winner: 'Dean',  loser: 'Elise', loser_points: 2 },
// ])


// Using the same data as the previous question, write a function that produces a data structure like the following, which lists each participant, and a list of who they've beaten.

// Output:

// {
//   'Alice': ['Bob', 'Carol'],
//   'Bob':   [],
//   'Carol': ['Dean'],
//   'Dean':  ['Elise'],
//   'Elise': ['Bob', 'Carol'],
// }

// making an object, each key holds an array
// the keys represent the player names

function checkTheStatistics(stats){
  const tally = {};
  for (let player of stats) {
    if(!tally[player.winner]){
        tally[player.winner] = []
    }
    if(!tally[player.loser]){
        tally[player.loser] = []
      }
  }
 

  for(player in tally){
    for (p of stats){
      if(player === p.winner){
        if(!tally[player].includes(p.loser)){
            tally[player].push(p.loser)
        }
      }
       
      }
  }

  console.log(tally)
  return tally
}

checkTheStatistics([
          { winner: 'Alice', loser: 'Bob',   loser_points: 3 },
          { winner: 'Carol', loser: 'Dean',  loser_points: 1 },
          { winner: 'Elise', loser: 'Bob',   loser_points: 2 },
          { winner: 'Elise', loser: 'Carol', loser_points: 4 },
          { winner: 'Alice', loser: 'Carol', loser_points: 2 },
          { winner: 'Carol', loser: 'Dean',  loser_points: 3 },
          { winner: 'Dean',  loser: 'Elise', loser_points: 2 },
    ])

// if winner, push player.winner, player.loser