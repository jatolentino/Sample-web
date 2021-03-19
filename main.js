let out = document.getElementById('stopwatch');

let mins = 0;
let ms= 0;
let sec = 0;


function timer() {
    ms++;
    if(ms >= 100){
        sec++
        ms = 0
    }
    if(sec === 60){
        min++
        sec = 0
    }
    if(min === 60){
        ms, sec, mins = 0;
    }
    //Doing some string interpolation
    let millis = ms < 10 ? `0`+ ms : ms;
    let seconds = sec < 10 ? `0`+ sec : sec;
    let minutes = min < 10 ? `0` + min : min;

    let timer= `${minutes}:${seconds}:${millis}`;
    output.innerHTML =timer;
};
